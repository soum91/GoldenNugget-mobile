# Changelog

## [v9.7.6] - 2026-11-10

## Verified changes since project start

- ci: publish verified 9.7.6 IPA and refresh FlareStore source after manual build ([`159ed3ce`](https://github.com/soum91/GoldenNugget-mobile/commit/159ed3ce38c0ad09387d3885f48e98c4528830a2); `.github/workflows/publish-ipa.yml`)
- Add FlareStore source with verified upstream IPA and pending fork notice ([`d6a28ff7`](https://github.com/soum91/GoldenNugget-mobile/commit/d6a28ff70370afa257ed7597c050e64a471b8eb6); `repo.json`)
- Fix iOS Batter template file import picker ([`0f3e97c0`](https://github.com/soum91/GoldenNugget-mobile/commit/0f3e97c0a7b52fb3dbe1ed2c05a49e57ab0cf563); `Nugget/Views/CommunityCatalogView.swift`, `Nugget/Views/TemplatesView.swift`, `layout/Applications/GoldenNuggetMobile.app/Info.plist`, and 1 more)
- fix: keep the pairing buttons from firing together ([`787c530c`](https://github.com/soum91/GoldenNugget-mobile/commit/787c530c7c0cee885bfe25a8883085e097418f6a); `Nugget/Views/GoldenNuggetView.swift`)
- \[QOL\] Add a String Catalog and make every UI string localizable ([`31c6ae03`](https://github.com/soum91/GoldenNugget-mobile/commit/31c6ae0347cc6e2495f48f3dc4c93dc9181d8cd4); `.github/workflows/build.yml`, `Nugget/Core/ApplyPreview.swift`, `Nugget/Core/PasscodeTheme.swift`, and 35 more)
- \[QOL\] more daemons and rework first run ([`08e26650`](https://github.com/soum91/GoldenNugget-mobile/commit/08e266501576a4a9ae1a03243672a3887b59e729); `Nugget/Core/TweakCatalogDaemons.swift`, `Nugget/Views/FirstRunArt.swift`, `Nugget/Views/FirstRunView.swift`, and 3 more)
- fix: bound the Rust log, answer the disk purge, and keep launch under the watchdog ([`7bc75567`](https://github.com/soum91/GoldenNugget-mobile/commit/7bc755678136ea69eea30e26874aa8240a72defa); `Nugget/Core/AppPaths.swift`, `Nugget/Core/Logging.swift`, `Nugget/Core/ProtectiveBackup.swift`, and 8 more)
- feat: keep a copy of the device's photos and videos, and restore it from home ([`be433913`](https://github.com/soum91/GoldenNugget-mobile/commit/be433913455595ebd1081b9dbe848dfe1ca7ff0b); `Nugget/Core/AfcMediaBackup.swift`, `Nugget/Core/FirstRun.swift`, `Nugget/Core/GoldenNuggetEngine.swift`, and 6 more)
- fix: deliver PosterBoard's store in WAL mode and one copy of each wallpaper ([`aac147cc`](https://github.com/soum91/GoldenNugget-mobile/commit/aac147ccc0fd2ac5058053cee08a2914bd7b2058); `Nugget/Core/BackupInjector.swift`, `Nugget/Core/PosterBoard.swift`, `Nugget/Core/PosterBoardBackup.swift`, and 8 more)
- fix: sync bundled app version with 9.7.2 release ([`6f271b26`](https://github.com/soum91/GoldenNugget-mobile/commit/6f271b2690798325554b7d38a319b4ecf77ab2f2); `layout/Applications/GoldenNuggetMobile.app/Info.plist`)
- Port HotLoad safety rules and add mobile update detection ([`7729bd02`](https://github.com/soum91/GoldenNugget-mobile/commit/7729bd027eb2f3b7523abf429c8cfde050363c7f); `Nugget/Core/Airlift.swift`, `Nugget/Core/AppRelease.swift`, `Nugget/Core/ApplyPreview.swift`, and 22 more)
- Sync contributor credits with desktop 9.7.2 ([`4fc9dfa8`](https://github.com/soum91/GoldenNugget-mobile/commit/4fc9dfa87010de5724889144562685adb04bf784); `Nugget/Views/SettingsView.swift`, `README.md`, `docs/desktop-sync-2026-10-26.md`, and 1 more)
- Sync desktop 9.7.2 tweaks, templates and restore safeguards ([`4e6a595d`](https://github.com/soum91/GoldenNugget-mobile/commit/4e6a595d9fdce5e0a925d572c581f361b6664b54); `Nugget/Core/AfcMediaBackup.swift`, `Nugget/Core/ApplyPreview.swift`, `Nugget/Core/CommunityCatalog.swift`, and 18 more)
- Sync desktop Siri AI operations and add mobile 9.7.1 changelog ([`a607d144`](https://github.com/soum91/GoldenNugget-mobile/commit/a607d14471f1a48a2ab18996d86d892bb803a795); `Nugget/Core/GoldenNuggetEngine.swift`, `Nugget/Core/TweakCatalog.swift`, `Nugget/Core/TweakCompiler.swift`, and 11 more)
- Sync desktop 9.7.1 tweaks and preserve PosterBoard snapshots ([`7d0fe648`](https://github.com/soum91/GoldenNugget-mobile/commit/7d0fe648bc01d5d95fdad6f90a011c520bffadd0); `Nugget/Core/BackupInjector.swift`, `Nugget/Core/GoldenNuggetEngine.swift`, `Nugget/Core/GoldenNuggetPresets.swift`, and 32 more)
- Fix daemon and template handling, gate AirLift on iOS 27.2 beta 3 ([`6958632b`](https://github.com/soum91/GoldenNugget-mobile/commit/6958632bc8f057d6fa53c8249f468b0e9eccaa7e); `Nugget/Core/Airlift.swift`, `Nugget/Core/AirliftAvailability.swift`, `Nugget/Core/AppPaths.swift`, and 28 more)
- Fix daemon confirmations, PosterBoard handling, and build warnings ([`43eb25a4`](https://github.com/soum91/GoldenNugget-mobile/commit/43eb25a4305f11be880a00ffbb9502607bb9c323); `Nugget/Core/AfcMediaBackup.swift`, `Nugget/Core/PosterBoardAirlift.swift`, `Nugget/Core/PosterBoardBackup.swift`, and 21 more)
- Sync desktop icon tweaks and accessibility reset ([`9ce1b9a4`](https://github.com/soum91/GoldenNugget-mobile/commit/9ce1b9a44368bc1e984b7c0190d97d5ccff6302b); `Nugget/Core/TweakCatalog.swift`, `Nugget/Core/TweakReset.swift`, `docs/desktop-sync.md`, and 1 more)
- fix(ci): compile the Icon Composer document with supported Xcode settings ([`19d59912`](https://github.com/soum91/GoldenNugget-mobile/commit/19d599124987b28eb8eef921459745f0697930ad); `.github/workflows/assets-car.yml`, `.github/workflows/build.yml`, `docs/icon-compatibility.md`, and 2 more)
- Sync desktop tweaks and community catalog; fix tunnel readiness and restore regressions ([`540b136e`](https://github.com/soum91/GoldenNugget-mobile/commit/540b136e05d409424f5d0857d645a870f130399e); `Nugget/Core/AfcMediaBackup.swift`, `Nugget/Core/ApplyPreview.swift`, `Nugget/Core/CommunityApplyRecord.swift`, and 54 more)
- fix(restore): single-copy open_file_read to reduce peak memory during restore; clear progress between stages so UI doesn't stick at backup 100% ([`fd304798`](https://github.com/soum91/GoldenNugget-mobile/commit/fd304798cc48cec6b71f4e1e3a3a16dc07dd74a2); `Nugget/Core/GoldenNuggetEngine.swift`, `Vendor/MinimuxerGateway/idevice/MobileBackup2Delegate.swift`)
- build(airlift): rebuild libairlift_ffi.a with the corrected error reporting ([`f48b1c5c`](https://github.com/soum91/GoldenNugget-mobile/commit/f48b1c5c3f4bba8c9cb15d8d2b30c030ef1cdbba); `Vendor/AirliftFFI.xcframework/ios-arm64/libairlift_ffi.a`)
- fix(airlift): report the device's rejection, not the last tunnel timeout ([`c6dc8fa3`](https://github.com/soum91/GoldenNugget-mobile/commit/c6dc8fa3c9f064b5986d552f3621a3fdd622592d); `Vendor/AirliftFFI/rust-core/src/exploit.rs`)
- chore: stop tracking the generated Xcode project; build it in CI ([`e804ca27`](https://github.com/soum91/GoldenNugget-mobile/commit/e804ca27307e3eb2afc38adc514d396ae1eeddef); `.github/workflows/build.yml`, `.gitignore`, `GoldenNuggetMobile.xcodeproj/project.pbxproj`, and 2 more)
- chore: generate project.pbxproj from project.yml with XcodeGen ([`7e95466d`](https://github.com/soum91/GoldenNugget-mobile/commit/7e95466d47b7bbc979cc67a822c837ca5a6e2c0e); `GoldenNuggetMobile.xcodeproj/project.pbxproj`, `GoldenNuggetMobile.xcodeproj/xcshareddata/xcschemes/GoldenNuggetMobile.xcscheme`, `project.yml`)
- fix: send wireless pairing to Settings → Privacy & Security → Developer Mode ([`4dd43469`](https://github.com/soum91/GoldenNugget-mobile/commit/4dd43469268b8cd041d01a52b2a547cd59d7ae3f); `Nugget/Core/WirelessPairing.swift`, `Nugget/Views/FirstRunView.swift`, `Nugget/Views/GoldenNuggetView.swift`)
- port: apply preview, tweak conflicts, history, ETA and the preset manager ([`1f914c03`](https://github.com/soum91/GoldenNugget-mobile/commit/1f914c037b143de20fc940778d75569f97c6a4f9); `GoldenNuggetMobile.xcodeproj/project.pbxproj`, `Nugget/Core/AppPaths.swift`, `Nugget/Core/ApplyHistory.swift`, and 25 more)
- qol: synced GoldenNugget PC upstream changes ([`3b6c29d8`](https://github.com/soum91/GoldenNugget-mobile/commit/3b6c29d8debd630b135e64fe2523ef7823f663d1); `Nugget/Core/BackupBaseline.swift`, `Nugget/Core/PosterBoardConverter.swift`, `Nugget/Core/PosterBoardResources.swift`, and 8 more)
- chore: delete the dead Golden design-system layer and unused APIs ([`aec01744`](https://github.com/soum91/GoldenNugget-mobile/commit/aec01744c2abdf22f22e2c898c3211a4cb27b14c); `GoldenNuggetMobile.xcodeproj/project.pbxproj`, `Nugget/Core/Airlift.swift`, `Nugget/Core/AutoSaveBootstrap.swift`, and 15 more)
- fix: drop the wallpaper-downloads entry from the sidebar ([`b615e8f0`](https://github.com/soum91/GoldenNugget-mobile/commit/b615e8f00f7a1dc711e0c238ad2dcc73bdddec30); `Nugget/Views/AppShell.swift`, `Nugget/Views/PosterBoardView.swift`)
- chore: patch the xtool SDK headers so Swift 6.4 can build on Linux ([`8919209d`](https://github.com/soum91/GoldenNugget-mobile/commit/8919209dc608bb5988dfbb66be962616ebe4d32d); `scripts/build-ipa-xtool.sh`, `scripts/fix-sdk-arm-headers.sh`)
- port: first-run setup guide for the tunnel and the pairing record ([`82e173a9`](https://github.com/soum91/GoldenNugget-mobile/commit/82e173a94c214b4d956323d171352d79e1b3423a); `Nugget/Core/FirstRun.swift`, `Nugget/Core/PairingRecord.swift`, `Nugget/Views/AppShell.swift`, and 3 more)
- fix: keep one descriptor identity through the Protective PosterBoard write ([`5ee978ec`](https://github.com/soum91/GoldenNugget-mobile/commit/5ee978ec4be5c38fe5dccafadfa47c2bd12f0874); `Nugget/Core/PosterBoard.swift`, `docs/posterboard-port.md`, `scripts/posterboard-identity-check.swift`)
- chore: move Extensions under Views, ignore the dev env, fix repo links ([`18e406a4`](https://github.com/soum91/GoldenNugget-mobile/commit/18e406a4bcce1c0073298482ae758b86afda31b6); `.gitignore`, `CONTRIBUTING.md`, `FORKING.md`, and 5 more)
- fix: convert legacy packs over AirLift, and say why a fetch was rejected ([`4de72f75`](https://github.com/soum91/GoldenNugget-mobile/commit/4de72f753742704d29b0ccf798a735c46cb7d8cd); `Nugget/Core/GoldenNuggetEngine.swift`, `Nugget/Core/PosterBoardAirlift.swift`, `Nugget/Core/PosterBoardBackup.swift`, and 4 more)
- port: PosterBoard legacy wallpaper converter ([`faee4c41`](https://github.com/soum91/GoldenNugget-mobile/commit/faee4c41ae96a0fa72e4d4b950ad707eeef14560); `GoldenNuggetMobile.xcodeproj/project.pbxproj`, `Nugget/Core/PosterBoard.swift`, `Nugget/Core/PosterBoardConverter.swift`, and 4 more)
- port: wallpaper downloader page (Cowabunga + CaPlayground catalogs) ([`f7db9d6b`](https://github.com/soum91/GoldenNugget-mobile/commit/f7db9d6baa6c15b4a86d374ee915427813a9749c); `GoldenNuggetMobile.xcodeproj/project.pbxproj`, `Nugget/Core/WallpaperCatalog.swift`, `Nugget/Views/AppShell.swift`, and 2 more)
- fix: strip leading slashes from tweak manifest paths ([`478a26c5`](https://github.com/soum91/GoldenNugget-mobile/commit/478a26c5773a907d24f9acd87b859b9b77607f55); `Nugget/Core/TweakCompiler.swift`)
- Update GitHub Actions workflow for IPA build ([`803a2be3`](https://github.com/soum91/GoldenNugget-mobile/commit/803a2be3298566939683abf610d861da28ce185c); `.github/workflows/build.yml`)
- Register AppDomain bundles before restore ([`527b76ea`](https://github.com/soum91/GoldenNugget-mobile/commit/527b76ea64a8bd5e45c7c6c8ce9579108f4abbf4); `Nugget/Core/BackupInjector.swift`)
- Register AppDomain payloads in restore manifest ([`9bcefb2e`](https://github.com/soum91/GoldenNugget-mobile/commit/9bcefb2efe2ae1093752407ea5151e576efddcdb); `Nugget/Core/HostManifests.swift`)
- Fix PosterBoard full reset database creation ([`ad5a42a8`](https://github.com/soum91/GoldenNugget-mobile/commit/ad5a42a892ca0f7f19dcbdbf6d746a64833f0d95); `Nugget/Core/PosterBoardStore.swift`)
- Trigger patched IPA rebuild ([`af21471e`](https://github.com/soum91/GoldenNugget-mobile/commit/af21471ead3d7c9bdea84e97cc4cfa344de27d92); `.github/workflows/build.yml`)
- Configure IPA build workflow for fork ([`ea27dca2`](https://github.com/soum91/GoldenNugget-mobile/commit/ea27dca23b5116ffcd8c7d94117aaadbb66fb155); `.github/workflows/build.yml`)
- Fix PosterBoard file importer presentation ([`13de646a`](https://github.com/soum91/GoldenNugget-mobile/commit/13de646a2c8fa57965d6c73847f7df4753d69d7c); `Nugget/Views/PosterBoardView.swift`)
- port: on-device wireless self-pairing and a native SwiftUI screen pass ([`ae67bdda`](https://github.com/soum91/GoldenNugget-mobile/commit/ae67bdda10294e93e3c9349e137d5cb47da146e6); `.gitignore`, `GoldenNuggetMobile.xcodeproj/project.pbxproj`, `Nugget/Core/AirliftPairing.swift`, and 21 more)
- port: compile an Icon Composer .icon on Linux as a flat AppIcon ([`65ac7ccf`](https://github.com/soum91/GoldenNugget-mobile/commit/65ac7ccf2bd02ece67491c5a7de1a09ad018bb52); `scripts/compile-assets.sh`, `tools/AssetKit/Sources/AssetKit/AppIcon/AppIconPlist.swift`, `tools/AssetKit/Sources/AssetKit/AppIcon/IconBundle.swift`, and 7 more)
- chore: count the duplicate ACKs jktcp puts on the wire ([`846a92fd`](https://github.com/soum91/GoldenNugget-mobile/commit/846a92fd4187b7e3667145c253206f73d09fa03f); `Nugget/Core/StallGuard.swift`, `Nugget/Core/WireCensus.swift`, `scripts/analyse-minimuxer-log.py`)
- port: the StatusBar override tweak, classic struct and the iOS 27 archive ([`9364ccd6`](https://github.com/soum91/GoldenNugget-mobile/commit/9364ccd659f0adbc44636862953abfb8b647c5f8); `GoldenNuggetMobile.xcodeproj/project.pbxproj`, `Nugget/Core/GoldenNuggetEngine.swift`, `Nugget/Core/StatusBarArchive.swift`, and 7 more)
- gate: build the iOS archive on Linux, from the xtool SDK ([`51f693ba`](https://github.com/soum91/GoldenNugget-mobile/commit/51f693ba1c009413e5fcb315b46bffa0841b6c51); `scripts/build-idevice-ios.sh`)
- fix: hold the jktcp window steady across duplicate ACKs, so the peer fast-retransmits ([`7c1e85f5`](https://github.com/soum91/GoldenNugget-mobile/commit/7c1e85f58388a8a90d9a8c4a0f7aad79294c2930); `Vendor/IDevice.xcframework/ios-arm64/libidevice_ffi.a`, `Vendor/patches/jktcp/README-PATCH.md`, `Vendor/patches/jktcp/src/adapter.rs`)
- fix: the synthesised Manifest.plist carried no keybag, so the device refused the restore ([`54579ad1`](https://github.com/soum91/GoldenNugget-mobile/commit/54579ad13107ff07997b4376601e14dfae69bb08); `Nugget/Core/HostManifests.swift`)
- gate: build the iOS archive without xcrun, and prove the linked one is that build ([`9db94a4d`](https://github.com/soum91/GoldenNugget-mobile/commit/9db94a4d5f1f6cab1cc5cb50ced2333fc09d1260); `.gitignore`, `scripts/__pycache__/check-car-appearances.cpython-314.pyc`, `scripts/build-airlift-ffi-ios.sh`, and 6 more)
- port: AirLift — inject PosterBoard descriptors, then restart userspace ([`32c58dc7`](https://github.com/soum91/GoldenNugget-mobile/commit/32c58dc76fd038968aa9856f4867d43c72d5ea1d); `GoldenNuggetMobile.xcodeproj/project.pbxproj`, `Nugget/Core/Airlift.swift`, `Nugget/Core/GoldenNuggetEngine.swift`, and 359 more)
- fix: the PosterBoard keep-filter matched the wrong argument, so the container was drained ([`5e38c5f9`](https://github.com/soum91/GoldenNugget-mobile/commit/5e38c5f92e38ca556e0ecb2b84cf1f15c9ab0142); `Nugget/Core/PosterBoardBackup.swift`, `docs/posterboard-port.md`)
- fix: the PosterBoard fetch — find the store without trusting the manifest ([`16e2f915`](https://github.com/soum91/GoldenNugget-mobile/commit/16e2f9157f3f4bb14b44e89efc1698bdd70b88ce); `Nugget/Core/GoldenNuggetEngine.swift`, `Nugget/Core/ManifestStore.swift`, `Nugget/Core/PosterBoardBackup.swift`, and 1 more)
- fix: the PosterBoard page never read the device line's identity ([`1202c1f0`](https://github.com/soum91/GoldenNugget-mobile/commit/1202c1f042395a135906cde26fd9ced575155046); `Nugget/Views/PosterBoardView.swift`)
- ui: one Apply, not two — the wallpapers ride the tweak apply ([`942fcaed`](https://github.com/soum91/GoldenNugget-mobile/commit/942fcaed358a7b5d16e3ce60bb815ccf68bc737d); `Nugget/Core/GoldenNuggetEngine.swift`, `Nugget/Core/PosterBoard.swift`, `Nugget/Views/AppShell.swift`, and 4 more)
- docs: name the linked-symbol gate in the PosterBoard port's gate list ([`7d7f1dff`](https://github.com/soum91/GoldenNugget-mobile/commit/7d7f1dff87035265392a597ec91908c68df01f72); `docs/posterboard-port.md`)
- gate: check that every C symbol the gateway calls is in the archive that is linked ([`e283b887`](https://github.com/soum91/GoldenNugget-mobile/commit/e283b887ccb21c828ba9e7e458232eab1a383d7b); `docs/tweak-port.md`, `scripts/check-linked-symbols.py`)
- fix: drop plist_new_date — the archive the app links does not export it ([`ce291f8b`](https://github.com/soum91/GoldenNugget-mobile/commit/ce291f8bd7a06c900ac434a2f19035d7172f8019); `Nugget/Core/PosterBoard.swift`, `Nugget/Core/PosterBoardStore.swift`, `Nugget/Core/PosterBoardTendie.swift`, and 2 more)
- fix: the PosterBoard video stage's async signatures ([`74f9bd4e`](https://github.com/soum91/GoldenNugget-mobile/commit/74f9bd4e4bfb34a62ca818147fb9af9ab77c5e6a); `Nugget/Core/PosterBoardVideo.swift`)
- feat: PosterBoard — wallpaper packs, video wallpapers and the store resets ([`9885f3bd`](https://github.com/soum91/GoldenNugget-mobile/commit/9885f3bd3dc71242b165fa06af104a661df3d94c); `GoldenNuggetMobile.xcodeproj/project.pbxproj`, `Nugget/Core/AppPaths.swift`, `Nugget/Core/BackupInjector.swift`, and 27 more)
- Fix contributor links in README.md ([`c2ba6397`](https://github.com/soum91/GoldenNugget-mobile/commit/c2ba63976194da8267b162f07d35934f02024f67); `README.md`)
- Fix NuggetLogo link to 1x resolution ([`5f50c8a5`](https://github.com/soum91/GoldenNugget-mobile/commit/5f50c8a5f0eee2fe85a71af8cfdbec0b67f3936e); `README.md`)
- docs: the README is the project's, not a build-notes stub ([`d83fcc67`](https://github.com/soum91/GoldenNugget-mobile/commit/d83fcc67cdb92b04a9a30c8783cbde4a7ac1ca6b); `README.md`)
- i18n: the docs and the user-facing strings are in English now ([`6a7b54a4`](https://github.com/soum91/GoldenNugget-mobile/commit/6a7b54a40092489a118e33001f7328bf7781c1c8); `Nugget/Core/Diagnostics.swift`, `Nugget/Core/StallGuard.swift`, `Nugget/Core/TransportFailure.swift`, and 4 more)
- feat: reset the device by page, drop Supervision, a real Files browser ([`7459cac5`](https://github.com/soum91/GoldenNugget-mobile/commit/7459cac5abac76757fd85b7c1ce9b34bc1c5160a); `GoldenNuggetMobile.xcodeproj/project.pbxproj`, `Nugget/Core/AfcFileExplorer.swift`, `Nugget/Core/GoldenNuggetEngine.swift`, and 15 more)
- ui: sidebar shell, a Settings page, and a self-refreshing device line ([`33dc24d5`](https://github.com/soum91/GoldenNugget-mobile/commit/33dc24d5453dca152c73a93e553b3d5621722cd5); `GoldenNuggetMobile.xcodeproj/project.pbxproj`, `Nugget/Core/DevSettings.swift`, `Nugget/Core/DeviceIdentity.swift`, and 11 more)
- fix: stop GoldenLogo from aborting the process on the iconstack ([`b5a94744`](https://github.com/soum91/GoldenNugget-mobile/commit/b5a94744a7cdf4784425097337523b194d607836); `Nugget/Views/GoldenComponents.swift`)
- Pairing file thing ([`a8cb62b0`](https://github.com/soum91/GoldenNugget-mobile/commit/a8cb62b07a2fa66bed0e036ad73613df8750aa99); `Nugget/Views/AppShell.swift`, `Nugget/Views/GoldenNuggetView.swift`, `docs/restore-path-audit.md`, and 3 more)
- Revert the pairing record store ([`50c6c7e4`](https://github.com/soum91/GoldenNugget-mobile/commit/50c6c7e4312513995390c2fda6340c49babe779a); `GoldenNuggetMobile.xcodeproj/project.pbxproj`, `Nugget/Core/PairingStore.swift`, `Nugget/NuggetApp.swift`, and 2 more)
- asset: build the alternate as Telegram's exact appiconset ([`564f259e`](https://github.com/soum91/GoldenNugget-mobile/commit/564f259e5b90568682fc15c0f3898b0cdd7bdb18); `.github/workflows/assets-car.yml`, `assets-src/README.md`, `assets-src/scrapped-1024.png`, and 18 more)
- asset: test whether an alternate must be an iconstack ([`5bff4b70`](https://github.com/soum91/GoldenNugget-mobile/commit/5bff4b702eb3d325b09aae5ebe6dc3a90f80bc06); `.github/workflows/assets-car.yml`, `layout/Applications/GoldenNuggetMobile.app/Assets.xcassets/ScrappedIcon.appiconset/Contents.json`, `layout/Applications/GoldenNuggetMobile.app/Assets.xcassets/ScrappedIcon.appiconset/icon_1024.png`, and 3 more)
- ci: name the primary icon bundle by path again ([`4beff2ab`](https://github.com/soum91/GoldenNugget-mobile/commit/4beff2abcc096159fd358db696fa595c9d4f09ca); `.github/workflows/assets-car.yml`)
- asset: make the "Scrapped" alternate a plain appiconset ([`b0fb4730`](https://github.com/soum91/GoldenNugget-mobile/commit/b0fb47301b13ebeb866b74757a7f927c5ceca8e0); `.github/workflows/assets-car.yml`, `layout/Applications/GoldenNuggetMobile.app/Assets.xcassets/ScrappedIcon.appiconset/Contents.json`, `layout/Applications/GoldenNuggetMobile.app/Assets.xcassets/ScrappedIcon.appiconset/icon_1024.png`, and 2 more)
- Compile the "Scrapped" alternate icon into Assets.car too ([`5da98ec4`](https://github.com/soum91/GoldenNugget-mobile/commit/5da98ec47011b2f12e8e72561e0370c05d9bc5fb); `.github/workflows/assets-car.yml`, `layout/Applications/GoldenNuggetMobile.app/Assets.xcassets/ScrappedIcon.icon/Assets/scrapped.png`, `layout/Applications/GoldenNuggetMobile.app/Assets.xcassets/ScrappedIcon.icon/icon.json`)
- UI changes and performance improvement ([`ee1c71ac`](https://github.com/soum91/GoldenNugget-mobile/commit/ee1c71ac7318027dba124fb6c7fe6037ede9dfee); `GoldenNuggetMobile.xcodeproj/project.pbxproj`, `Nugget/Core/AfcMediaBackup.swift`, `Nugget/Core/GoldenNuggetEngine.swift`, and 20 more)
- A file browser over the device's own AFC service ([`f6210470`](https://github.com/soum91/GoldenNugget-mobile/commit/f6210470acc94d14f74479ccf560d7a202acf4a7); `Nugget/Core/AfcFileExplorer.swift`, `Nugget/Views/FilesView.swift`, `Nugget/Views/GoldenNuggetView.swift`)
- Give every row its real editors instead of a placeholder ([`df842d6d`](https://github.com/soum91/GoldenNugget-mobile/commit/df842d6d754ed20c05ca84531145d4af1ba80cd6); `Nugget/Views/DaemonsView.swift`, `Nugget/Views/TweakRow.swift`, `Nugget/Views/TweaksView.swift`)
- Persist daemon changes, and give the page the Tweaks page's shape ([`f1d6e5a7`](https://github.com/soum91/GoldenNugget-mobile/commit/f1d6e5a7094abe7d74eebe257a0e50e9b1d90b51); `Nugget/Views/DaemonsView.swift`, `Nugget/Views/GoldenNuggetView.swift`, `Nugget/Views/TweakRow.swift`, and 1 more)
- Cut the Supervision page down to the switch and the organization name ([`2d6f4cdf`](https://github.com/soum91/GoldenNugget-mobile/commit/2d6f4cdfcb71a28881e2ac834f5ec7019c8e05f9); `Nugget/Views/GoldenNuggetView.swift`, `Nugget/Views/SupervisionView.swift`)
- Open the tweak sections that have something switched on ([`271bb5e9`](https://github.com/soum91/GoldenNugget-mobile/commit/271bb5e9119007567e8815bafed8a295e938b3f9); `Nugget/Views/TweaksView.swift`)
- Answer the device's Manifest.db request, and mark the pull a full backup ([`4d40fbb6`](https://github.com/soum91/GoldenNugget-mobile/commit/4d40fbb6342f8f441dbbe39a866da24b2acd729c); `Nugget/Core/HostManifests.swift`, `Nugget/Core/ProtectiveBackup.swift`)
- Load the selection at launch, save daemons, pull media with the run ([`4664af10`](https://github.com/soum91/GoldenNugget-mobile/commit/4664af10370a483f500f8106ca836bf613b04400); `Nugget/Core/AutoSaveBootstrap.swift`, `Nugget/Core/GoldenNuggetAutosave.swift`, `Nugget/Core/GoldenNuggetEngine.swift`, and 2 more)
- Report the per-domain keep/drop counts when nothing is kept ([`0e3473ea`](https://github.com/soum91/GoldenNugget-mobile/commit/0e3473eafbfeb27e79b779452a5a5a9f163b2a24); `Nugget/Core/ProgressPulse.swift`, `Nugget/Core/ProtectiveBackup.swift`)
- Unblock Push back and Empty, and make push survive real files ([`f0a15bec`](https://github.com/soum91/GoldenNugget-mobile/commit/f0a15bec85bcfaaadb0dd60680d4d4434ed26199); `Nugget/Core/AfcMediaBackup.swift`, `Nugget/Views/MediaView.swift`)
- Restore CameraRollDomain to the protective keep-set ([`0d39daf1`](https://github.com/soum91/GoldenNugget-mobile/commit/0d39daf1df915a647f351d5693c1646ab734ee5f); `Nugget/Core/ProtectiveBackup.swift`)
- Fix the AFC survey skipping every media tree ([`6081b1a7`](https://github.com/soum91/GoldenNugget-mobile/commit/6081b1a7b651ff61c6392823a6e0299dbe3aa991); `Nugget/Core/AfcMediaBackup.swift`)
- Separate the two causes of a zero-file protective backup ([`2306f977`](https://github.com/soum91/GoldenNugget-mobile/commit/2306f9779baab3659277bcb07aa9018da589f2b1); `Nugget/Core/ProtectiveBackup.swift`)
- Fail the run when the protective backup keeps nothing ([`f1328ce4`](https://github.com/soum91/GoldenNugget-mobile/commit/f1328ce4956b6464ad6d4849e966b05bc50d938c); `Nugget/Core/ProgressPulse.swift`, `Nugget/Core/ProtectiveBackup.swift`)
- AFC media transfer: move the photo trees into the app container ([`6802a896`](https://github.com/soum91/GoldenNugget-mobile/commit/6802a8960c603c497e83a7a3f435e0244b8f43c2); `Nugget/Core/AfcMediaBackup.swift`, `Nugget/Core/AppPaths.swift`, `Nugget/Views/GoldenNuggetView.swift`, and 2 more)
- Protective on iOS 27, Partial Restore only on iOS 26 ([`98c3994e`](https://github.com/soum91/GoldenNugget-mobile/commit/98c3994eedca8b6ec70bb85f302166d2d907e745); `Nugget/Core/GoldenNuggetEngine.swift`)
- Trim the interface copy on Supervision and Daemons ([`5adfce7c`](https://github.com/soum91/GoldenNugget-mobile/commit/5adfce7cc61e5a38876707d9a3de4203b2618517); `Nugget/Views/DaemonsView.swift`, `Nugget/Views/GoldenNuggetView.swift`, `Nugget/Views/SupervisionView.swift`)
- Drop Apply from the tweaks page, unstick the switches, start folded ([`32572dca`](https://github.com/soum91/GoldenNugget-mobile/commit/32572dcab02ba2372f235df3e6c77551d404280a); `Nugget/Views/TweaksView.swift`)
- Make the tweak categories collapsible ([`2d2baf66`](https://github.com/soum91/GoldenNugget-mobile/commit/2d2baf66ea2fb0cde21cd9822a9256faf7b543cb); `Nugget/Views/GoldenComponents.swift`, `Nugget/Views/TweaksView.swift`)
- Show the home-screen icon as the in-app logo ([`aeca8673`](https://github.com/soum91/GoldenNugget-mobile/commit/aeca8673515b1483e2dfffe61a7101ab25dfee63); `Nugget/Views/GoldenComponents.swift`, `layout/Applications/GoldenNuggetMobile.app/Logo@1x.png`, `layout/Applications/GoldenNuggetMobile.app/Logo@2x.png`, and 1 more)
- Write the iOS 26 manifest as legacy MBDB ([`ef804a73`](https://github.com/soum91/GoldenNugget-mobile/commit/ef804a737d0f51272c0efd15e54ef0d8ccdd8390); `Nugget/Core/BackupInjector.swift`, `Nugget/Core/GoldenNuggetEngine.swift`, `Nugget/Core/HostManifests.swift`, and 1 more)
- Build the restore backup from nothing on Apply ([`6a1e255f`](https://github.com/soum91/GoldenNugget-mobile/commit/6a1e255f6ceb00acd517181b72393b789145b894); `Nugget/Core/BackupInjector.swift`, `Nugget/Core/GoldenNuggetEngine.swift`, `Nugget/Views/TweaksView.swift`)
- Daemons page and a Supervision tab ([`136830f5`](https://github.com/soum91/GoldenNugget-mobile/commit/136830f5ab883d538d4286d105014900e49fa8a9); `Nugget/Core/GoldenNuggetPreset.swift`, `Nugget/Core/SupervisionSettings.swift`, `Nugget/Core/TweakCatalog.swift`, and 9 more)
- 25 additional specific commits in the comparison linked below.

[Inspect exact code changes](https://github.com/soum91/GoldenNugget-mobile/commits/v9.7.6)

# GoldenNugget Mobile

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
