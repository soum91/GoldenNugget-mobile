# Cross-project handoff: Mond .batter wrongly reaches PosterBoard in Windows GoldenNugget

Date: 2026-11-10. Target repository: `soum91/GoldenNugget-mobile`. **This incident was reproduced in the separate desktop fork, not in the mobile app.** This note asks Claude to check whether the mobile implementation has an analogous bug, without asserting that it does.

## Primary evidence and ownership
The complete user-visible 3+ hour Windows failure timeline, exact log transcriptions, three uploaded screenshots, attempted code fix and green-but-not-device-verified CI are stored in the desktop fork:

https://github.com/soum91/GoldenNugget/blob/main/docs/diagnostics/2026-11-10-mond-posterboard-backup-failure.md

### Essential failure
- User imported a community Mond iOS 27 windowing `.batter` tweak, with no wallpaper/PosterBoard changes.
- Windows GoldenNugget backed up to 100%, taking approximately 3+ hours, then executed `Generating PosterBoard Video...` and `Adding tendies...`.
- Expanded log: `Backup upload tally: seen=220546 kept=28366 container_paths=220545 | PosterBoard names seen=0 (kept 0, dropped 0)`.
- Error: `PosterBoard database file not selected!`; operation not confirmed; no proof tweak was applied.
- Desktop fix attempted in `src/controllers/tweak_compiler.py` and `src/tweaks/posterboard/posterboard_tweak.py` to route non-PosterBoard templates only to `TemplatesTweak`. A Windows CI test passes; this is NOT a device validation.
- User earlier had insufficient Windows cache free space (31.8 GiB), later corrected; that is a separate earlier failure.

## Claude's task in *mobile* repository
1. Find mobile equivalents of `needs_posterboard_database`, template classification, tweak compilation, PosterBoard import and apply/restore stages.
2. Verify an ordinary community `.batter` (empty domain or other app domain) does NOT require or enter PosterBoard. Actual `com.apple.PosterBoard` imports and explicit wallpaper resets must retain intended behavior.
3. Check version-specific behavior for iOS 27.x and whether the mobile app can apply Mond safely without requiring an unrelated backup/DB step. Do not assume desktop Python path maps 1:1 to mobile Rust/Swift code.
4. Add unit tests for both community-only and genuine wallpaper templates, plus a realistic end-to-end workflow where possible.
5. If a costly operation is necessary, validate all preconditions before it. Never skip required backup/data-protection measures solely to silence an error.
6. Keep full reproducible diagnostics with Copy, Share, Save and sanitized device identifiers. Do not mark fixed on emulator/CI alone.

## Photos / logs
See desktop evidence folder:
- https://github.com/soum91/GoldenNugget/blob/main/docs/diagnostics/evidence/IMG_8485.jpeg (backup 100%)
- https://github.com/soum91/GoldenNugget/blob/main/docs/diagnostics/evidence/IMG_8486.jpeg (error modal)
- https://github.com/soum91/GoldenNugget/blob/main/docs/diagnostics/evidence/IMG_8487.jpeg (expanded log)

No user real name, account secrets or device serials included in this handoff.
