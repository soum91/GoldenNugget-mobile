#!/usr/bin/env python3
"""Regression guard: community format-3 .batter tweaks never reach PosterBoard.

Cross-repo incident (2026-11-10, desktop soum91/GoldenNugget): a community-only
Mond iOS 27 windowing .batter sat through a 3+ hour protective backup, then the
desktop compiler entered PosterBoard staging and failed with
"PosterBoard database file not selected!". See
docs/diagnostics/2026-11-10-mond-posterboard-crosscheck.md.

Mobile audit result (source inspection, NOT a device reproduction): this port
routes those packages differently and is not affected —
  * TemplatesView imports a package through CommunityTemplate.load first; a
    format-3, options-free, container-free package becomes a community library
    entry, never a TemplateFile;
  * CommunityTemplateStore.compile -> communityPayloads -> TweakCompiler.merging
    -> tweakPayloads (plain Managed/Home preference writes);
  * the PosterBoard branch (database fetch + PosterBoard.compile) opens only on
    `posterBoard.isActive || !posterBoardTemplates.isEmpty`, and only
    `template.isPosterBoard` TemplateFiles are appended to posterBoardTemplates.

This script pins those invariants with static source checks (no macOS/Swift
toolchain required) and validates the routing against real format-3 fixtures:
the desktop repo's community-batters when it sits next to this checkout, and an
inline Mond-shaped fixture always. A future edit that lets community payloads
or empty-domain templates open the PosterBoard branch fails here.

Run: python3 scripts/check-community-posterboard-routing.py
"""
import json
import re
import sys
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
FAILURES: list[str] = []


def check(condition: bool, message: str) -> None:
    if not condition:
        FAILURES.append(message)


def read(rel: str) -> str:
    return (ROOT / rel).read_text(encoding="utf-8")


engine = read("Nugget/Core/GoldenNuggetEngine.swift")
template_file = read("Nugget/Core/TemplateFile.swift")
community = read("Nugget/Core/CommunityTemplates.swift")
templates_view = read("Nugget/Views/TemplatesView.swift")

# 1. PosterBoard branch gate: only real wallpaper work or PosterBoard templates.
gates = re.findall(r"if \(?posterBoard\.isActive \|\| !posterBoardTemplates\.isEmpty\)?", engine)
check(len(gates) >= 2,
      "GoldenNuggetEngine: the PosterBoard branch must stay gated on "
      "`posterBoard.isActive || !posterBoardTemplates.isEmpty` (AirLift + backup paths)")

# 2. Only isPosterBoard templates feed posterBoardTemplates.
appends = [m.start() for m in re.finditer(r"posterBoardTemplates\.append\(", engine)]
check(len(appends) == 1, "posterBoardTemplates must have exactly one append site")
for pos in appends:
    window = engine[max(0, pos - 400):pos]
    check("if template.isPosterBoard" in window,
          "posterBoardTemplates.append must sit under `if template.isPosterBoard`")

# 3. PosterBoardBackup.fetch / PosterBoard.compile never see community payloads.
for call in ("PosterBoardBackup.fetch(", "PosterBoard.compile("):
    pos = engine.find(call)
    check(pos != -1, f"expected {call} in GoldenNuggetEngine")
    if pos != -1:
        stmt = engine[pos:engine.find(")\n", pos) + 1]
        check("communityPayloads" not in stmt, f"{call} must not receive communityPayloads")

# 4. Community payloads merge into the tweak payloads, nowhere PosterBoard-shaped.
check("TweakCompiler.merging(community: communityPayloads" in engine,
      "communityPayloads must flow through TweakCompiler.merging")
check(not re.search(r"posterBoard\w*\s*\+?=\s*.*communityPayloads", engine),
      "communityPayloads must not be assigned into a PosterBoard payload list")

# 5. isPosterBoard recognises exactly the two PosterBoard domain spellings,
#    so an empty-domain template can never be classified as PosterBoard.
m = re.search(r"var isPosterBoard: Bool \{\s*(.+?)\s*\}", template_file, re.S)
check(m is not None, "TemplateFile.isPosterBoard not found")
if m:
    body = m.group(1)
    check('"com.apple.PosterBoard"' in body and '"AppDomain-com.apple.PosterBoard"' in body,
          "isPosterBoard must match the PosterBoard domains explicitly")
    check("isEmpty" not in body and "hasPrefix" not in body,
          "isPosterBoard must not use a prefix/empty test that could match community packages")

# 6. Import order: community library first, TemplateFile second.
pos_comm = templates_view.find("CommunityTemplate.load(url)")
check(pos_comm != -1, "TemplatesView must try CommunityTemplate.load before TemplateFile")

# 7. CommunityTemplate.load refuses PosterBoard/container packages.
check('$0.split(separator: "/").contains("container")' in community,
      "CommunityTemplate.load must refuse packages with a container/ tree")
check('(raw["options"] as? [Any] ?? []).isEmpty' in community,
      "CommunityTemplate.load must refuse packages with wallpaper options")


# --- behavioural routing over real fixtures ---------------------------------
def community_accepts(config: dict, names: list[str]) -> bool:
    """Mirror of CommunityTemplate.load's package gate."""
    return (str(config.get("format_version", "")) == "3"
            and isinstance(config.get("tweaks"), list) and len(config["tweaks"]) <= 64
            and not (config.get("options") or [])
            and not any("container" in n.split("/") for n in names))


def is_posterboard(config: dict) -> bool:
    domain = config.get("domain", "")
    if domain == "com.apple.PosterBoard":
        domain = "AppDomain-com.apple.PosterBoard"
    return domain in ("com.apple.PosterBoard", "AppDomain-com.apple.PosterBoard")


def route(config: dict, names: list[str]) -> str:
    if community_accepts(config, names):
        return "community"
    if "options" not in config or "domain" not in config:
        return "rejected"  # TemplateFile requires both
    return "posterboard" if is_posterboard(config) else "template-domain"


fixtures: list[tuple[str, dict, list[str]]] = []
mond = {"title": "Mond iOS 27 windowing (fixture)", "author": "fixture", "format_version": "3",
        "min_version": "27.0",
        "tweaks": [{"id": "MondWindowing", "label": "Windowing", "default": False,
                    "writes": [{"type": "plist",
                                "path": "/var/Managed Preferences/mobile/com.apple.springboard.plist",
                                "values": {"SBChamoisWindowingEnabled": True}}]}]}
fixtures.append(("inline:mond", mond, ["config.json"]))

desktop = ROOT.parent / "goldennugget" / "community-batters"
if not desktop.is_dir():
    desktop = ROOT.parent / "GoldenNugget" / "community-batters"
for batter in sorted(desktop.glob("*.batter")) if desktop.is_dir() else []:
    with zipfile.ZipFile(batter) as z:
        names = z.namelist()
        cfg = next(n for n in names if n.lower().endswith("config.json"))
        fixtures.append((batter.name, json.loads(z.read(cfg)), names))

for name, cfg, names in fixtures:
    r = route(cfg, names)
    check(r == "community", f"{name}: community .batter routed to {r}, expected community")

wallpaper = {"title": "wallpaper", "author": "x", "format_version": "2",
             "domain": "AppDomain-com.apple.PosterBoard", "options": []}
check(route(wallpaper, ["config.json", "container/x"]) == "posterboard",
      "genuine PosterBoard template must still route to PosterBoard")

if FAILURES:
    print("COMMUNITY_POSTERBOARD_ROUTING_FAILED")
    for f in FAILURES:
        print("  -", f)
    sys.exit(1)
print(f"COMMUNITY_POSTERBOARD_ROUTING_OK: {len(fixtures)} community fixture(s) stay off PosterBoard; "
      "PosterBoard templates still route to PosterBoard")
