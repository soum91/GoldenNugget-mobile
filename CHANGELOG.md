# GoldenNugget Mobile

## 9.7.7 (11) — Mond `.batter` template/tweak merge fix (pre-release)

- Audited the mobile apply path against the desktop Mond failure (a non-PosterBoard windowing `.batter` reaching PosterBoard staging after a multi-hour backup; the real package is a format-2 `ManagedPreferencesDomain` file template). Source inspection shows mobile is not affected: format-3 community packages import through `CommunityTemplate.load` into `CommunityTemplateStore`, compile into `communityPayloads` and merge into the tweak payloads. The PosterBoard database fetch and `PosterBoard.compile` only run for selected wallpapers, resets or `TemplateFile.isPosterBoard` templates. No mobile reproduction was claimed or found; not device-tested.
- Fixed a silent overwrite: a file template payload (such as the real Mond iPhone windowing package's `ManagedPreferencesDomain/mobile/com.apple.springboard.plist`) used to be upserted over an enabled tweak's payload for the same row, discarding those tweak keys. `TweakCompiler.foldingTemplates` now merges them before `prepareRun` (template as base, tweak keys win, matching desktop). A collision that cannot be merged fails before any backup. Not compiled in this environment; not device-tested.
- Added `scripts/check-community-posterboard-routing.py`, a regression check that needs no macOS toolchain. It pins those routing invariants in the Swift sources and routes every desktop `community-batters/*.batter` plus a Mond-shaped fixture to the community path. A genuine PosterBoard template still routes to PosterBoard.

## 9.7.6 (10) — `.batter` picker fix

- Register the `.batter` template file type with iOS, so Files can identify GoldenNugget templates.
- Allow templates from third-party Files providers that do not classify `.batter` as generic data. The archive parser still validates the selected file before importing it.
- Route template imports and replacement-file picks through one iOS document picker, preventing the two competing file importer modifiers from shadowing each other.
- Allow `.batter` selections in Community Catalog's local-import picker as well.

## Previous — Desktop 9.7.2 Sync

## HotLoad and updates

- Port HotLoad safety rules with offline caching, device/app version scopes, feature hiding, daemon overrides, warnings and mandatory-update gates.
- Check mobile GitHub releases automatically and from Settings, with release notes and IPA download links.
- Keep rule and release channels specific to GoldenNugget Mobile. Install updates using the existing sideloading workflow.

## General

- Add experimental Siri AI eligibility overrides for unsupported regions, plus a dedicated reset. Available on iPhones running iOS 27.x; upstream verification covers only iPhone 16 Pro, build 24A437. Requires Siri language English (US), an unencrypted protective backup, and a reboot.
- Expand the preference catalog to 258 tweaks, including a 60 FPS limit and the replacement Home Screen search setting for iOS 27.1+.
- Remove obsolete Apple Watch, NanoTimeKit, Translate, DeviceCheck and Decisiond daemon controls, matching desktop's 53 groups.
- Mirror managed preferences into HomeDomain on iOS 27; reset both copies with valid empty plists on every supported iOS version.
- Validate the complete AFC media inventory before restore and keep originals that change during copying. Incomplete restores report a failure while keeping local copies.
- Show untested catalog markers, import standalone community templates from Templates, and link to Batter Builder.
- Add an option to enable untested preference tweaks on iOS 26. Hardware restrictions and the stricter Siri AI requirements remain enforced.
- Improve iOS 27 network badges and cellular signal controls, including separate SIM settings and explicit zero-bar overrides.

## Media

- Copy the device's photos and videos into the app container automatically when the setup guide is finished, and top the copy up once per launch afterwards. Only files that changed are streamed again, so a launch costs a directory walk rather than a second copy of the library.
- Add a **Restore media** button to the home page, next to the counts of what the container holds, which writes every kept photo and video back to the device and verifies each one. The Media page keeps its manual survey, pull and empty tools. The automatic copy never deletes originals; that stays behind the Media page's own switch.
- Skip a media stage that would collide with an automatic copy in progress instead of reporting a failure, so an apply still runs while photos are being copied.

## PosterBoard

- Fix Full Reset failing with a `sqlite_sequence` error on empty databases.
- Deliver the PosterBoard database in WAL mode, which is the mode the device's own store declares — including the empty store a Full Reset installs. PosterBoard opens the store read-only and immediately runs `PRAGMA journal_mode=WAL`; on a DELETE-mode database that pragma is a write and fails with "attempt to write a readonly database", after which the store logs "data store never ever initialized" and rebuilds itself from the gallery. Every wallpaper got a new identity, and anything whose content lives only in the store — every custom wallpaper — disappeared. The snapshot is still self-contained: its pages are checkpointed into the main file and the `-wal`/`-shm` the restore carries stay zero-byte companions.
- Preserve native PosterBoard snapshots and manifest metadata when applying wallpaper changes.
- Deliver each wallpaper once, as the installed configuration the device's own store holds. A second copy under `Extensions/com.apple.Posters.CollectionsPosterApp/descriptors/` gave the store a duplicate identity it could not reconcile, and rebuilding the database is how it settled that — every wallpaper gone.
- Import only the applied wallpaper's own manifest rows and those of its parent directories. Directory records are instructions to place a directory, so re-importing the whole container's tree told the device to recreate directories whose files the restore never carried.
- Improve handling of damaged or invalid `.tendies` ZIP archives with readable import errors.

## UI

- Replace the phone's burger menu with the platform's tab bar: Home, Tweaks, Wallpapers, Media and a grouped **More** list for the remaining pages. The iPad keeps its sidebar, where both columns fit.
- Merge the Daemons page into Tweaks behind a Tweaks / Daemons switch, so one selection, one autosave and one Apply cover both halves.
- Trim the home page to the run: one line under Apply, a single folded row for pairing and the tunnel, a compact media card, and a one-sentence reset. The diagnostics dump and its share rows moved to Settings → Logs.
- Browse tweaks and daemon groups in collapsible categories using the native SwiftUI interface.
- Show experimental warnings, hardware requirements, and conflicting-tweak restrictions before applying changes.
- Ask for a cellular signal override when status-bar modifications are first enabled.

## Fixes

- Preserve loaded preset selections after restart when autosave is enabled, including explicit experimental rollback values.
- Apply iOS 26 compatibility preferences consistently when browsing, importing presets, previewing, and compiling tweaks.
- Improve daemon configuration, reject unknown daemon labels, and match desktop OTA preference cleanup during reset.
- Refuse Siri AI delivery through forced Partial Restore or an encrypted protective backup.
- Retain the mobile AirLift availability restriction from iOS 27.2 beta 3 onward.
- Bound the Rust diagnostic log and reclaim oversized ones at launch. A two-hour backup could write 18.7 GB into `minimuxer.log`, which left too little free space on the volume the device checks before uploading, so later backups offered zero files.
- Scan the diagnostic logs for leftover pairing secrets without the byte-by-byte walk that could not finish inside the launch allowance. A 54 MB `minimuxer.log` took 58 s in a Debug build, so iOS killed the app with a scene-create watchdog on every launch; the same scan is now 0.1 s and still finds a dump at the end of the file.
- Answer the device's disk-purge request instead of replying "not supported", and report the device's own refusal code. Free-space refusals now name the volume's free space rather than blaming the keep-filter.
- Make Stop work during a PosterBoard database fetch. That upload ran outside the stall watcher, which is the only thing that polls the stop flag, so the button reported "stop requested" and nothing happened.

Siri AI activation and restore have not yet been verified on a physical device with the mobile app. Reset Siri AI Overrides clears all eligibility overrides, including those installed by other tools; turning the enable switch off does not undo an applied override.
