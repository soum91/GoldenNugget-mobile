GoldenNugget Mobile: Guide for AI agents
## Requirements to build 
1. Swift 6
2. xcode 26 or xtool with iOS 26+ SDK
3. Rust (neospring, airlift)
4. Python (Optional, but nedeed to generate code from desktop version and some scripts)
## notes
All code files have detailed descriptions in it\
Never do anything with code unless user follow requirements.
## How it works
Main code stored in Nugget folder\
Core: all backend\
Views: frontend (SwiftUI)\
Scripts: many stuff like: building, debugging, generators and many other helpful things. Recommended to use these instead of raw CLI commands\
Tools: have AssetKit in it. useless if you have actool\
Vendor: Required to make app work, local forks with some patches


## Public attribution and owner privacy

Use `soum91` as the author, maintainer, developer, and publisher in all first-party metadata. Do not publish the owner's legal name, private email, or other personal identifiers in source, licenses, Sileo/FlareStore feeds, release assets, binary packages, generated docs, logs, or commits. Audit generated artifacts before publishing. Preserve legitimate third-party copyright notices. Existing bundle identifiers, app groups, and entitlements must not be silently changed, because doing so can break upgrades and stored data.

## Mandatory factual release changelog
Every release must document specific verified changes since the preceding release with actual commit/diff references. Reject generic notes, copied notes, and invented functionality. For rebuild-only releases, state the exact packaging, toolchain, or signing differences. Reconcile GitHub Release notes and root CHANGELOG.md; do not suppress failing factual checks. Preserve existing history and policies.

## Universal diagnostic export contract
Every generated diagnostic/log report requires Copy with clipboard read-back verification where supported and visible success/failure, native Share, native Save as plain `.txt` using the Files picker (`fileExporter` or `UIDocumentPickerViewController` on iOS), and selectable full report text as fallback. Never rely on a silent clipboard-only button. Include actual app/build version, device/OS and actionable return/error codes, while redacting secrets. Verify by pasting into another app and exercising Share/Files on a signed device; otherwise explicitly mark unverified.
