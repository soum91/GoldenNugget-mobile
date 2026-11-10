# Claude development instructions

Follow all existing rules in [AGENTS.md](AGENTS.md), including mandatory factual release changelogs and universal diagnostic export. Preserve source behavior, privacy, and historical changelog entries. Every diagnostic requires verified Copy with visible result, native Share, native plain-text Save to Files picker (`fileExporter` or `UIDocumentPickerViewController`), and selectable full text. Include version/build, device/OS, actionable error codes, redact secrets, and mark signed-device paste/Share/Files tests unverified until actually performed.

## Active cross-repository investigation (2026-11-10)
Read `docs/diagnostics/2026-11-10-mond-posterboard-crosscheck.md` before editing template/PosterBoard/apply logic. The full 3+ hour backup failure and three evidence screenshots were on the desktop GoldenNugget fork; inspect this mobile port independently for analogous incorrect template routing. Do not assert mobile reproduction without proof.
