# GoldenNugget Mobile

## 9.7.10 (14) — Runs keep the app alive

- Every run (apply, reset, media and the others that go through `loggedRun`) now turns off screen auto-lock until it ends, then restores the previous setting. On 9.7.9 an apply's protective backup could be cut off when auto-lock suspended the app (reported 2026-11-11).
- A run also holds a UIKit background task, so briefly switching apps gets iOS's roughly 30-second grace instead of an immediate suspension. Longer background time is not possible for this work; keep the app on screen.
- The app log now records when the app leaves or returns to the foreground, iOS memory warnings, and background time running out during a run. If iOS closes the app mid-run, the next launch says so in the home status line and the log.
- Not tested on a signed device in this build.

## 9.7.9 (13) — Apply summary sheet no longer opens empty

- Fixed Apply opening an empty grey sheet with no Apply or Cancel button. The home page set the apply preview and the sheet flag in the same update, and `.sheet(isPresented:)` with `if let applyPreview` could render the sheet before the preview reached it. The summary now uses `.sheet(item: $applyPreview)` (`ApplyPreview` is `Identifiable`), so the sheet always receives the preview it shows. Reported on a signed device running 9.7.8; this fix is not yet device-tested.
- Apply in the summary now starts the run from the sheet's `onDismiss`, after the sheet has fully closed, instead of during the dismissal animation. The home page's Apply button then shows "Applying…" with Stop run while it works.
- A failed or stopped apply now keeps its reason in the home status line until the next status replaces it. Previously every result faded after 6 seconds, so a failure could vanish before it was read. Success still fades.

## 9.7.8 (12) — `.batter` picker uses a real iOS document picker

- Templates ("Import .batter template" and option replacement files) and Community Catalog ("Import .batter or portable preset") now open a `UIDocumentPickerViewController` (`Nugget/Views/DocumentPicker.swift`) instead of SwiftUI's `.fileImporter`. On iPhone every `TabView` tab stays alive, and the home, Tweaks, PosterBoard, Files, Presets and Passcode pages each attach their own `.fileImporter`. SwiftUI shares one importer between them, so the Templates picker could open with another page's allowed types and grey out `.batter` files even though Templates requests `.item`. 9.7.6's notes described "one iOS document picker", but that release still used `.fileImporter`.
- The picker returns a copy (`asCopy: true`) in the app's own temporary inbox, so files from third-party File Providers that never assigned `.batter` a type import without a security-scoped bookmark.
- Not tested on a signed device in this build.

## 9.7.7 (11) — Mond `.batter` template/tweak merge fix

- Audited the mobile apply path against the desktop Mond failure (a non-PosterBoard windowing `.batter` reaching PosterBoard staging after a multi-hour backup; the real package is a format-2 `ManagedPreferencesDomain` file template). Source inspection shows mobile is not affected: format-3 community packages import through `CommunityTemplate.load` into `CommunityTemplateStore`, compile into `communityPayloads` and merge into the tweak payloads. The PosterBoard database fetch and `PosterBoard.compile` only run for selected wallpapers, resets or `TemplateFile.isPosterBoard` templates. No mobile reproduction was claimed or found; not device-tested.
- Fixed a silent overwrite: a file template payload (such as the real Mond iPhone windowing package's `ManagedPreferencesDomain/mobile/com.apple.springboard.plist`) used to be upserted over an enabled tweak's payload for the same row, discarding those tweak keys. `TweakCompiler.foldingTemplates` now merges them before `prepareRun` (template as base, tweak keys win, matching desktop). A collision that cannot be merged fails before any backup. Not compiled in this environment; not device-tested.
- `.github/workflows/build.yml` now publishes releases: a pushed `v<version>` tag (or `v<version>-pre.<build>` for a pre-release), a release published in the GitHub UI, or a manual run with `release_tag` set attaches the IPA it just built as `GoldenNuggetMobile-<version>-build<build>.ipa`, with this CHANGELOG section as notes. It refuses to publish if the tag, `Info.plist` and built IPA disagree, if the section is missing, and never replaces an existing asset. It does not edit the FlareStore `repo.json`.
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
