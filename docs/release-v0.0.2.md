# Private v0.0.2 formula preparation

Prepared 2026-10-11 on release/v0.0.2; main remains on v0.0.1. No existing
release assets or repository visibility settings were changed.

The proposed formula was refreshed from verified documentation candidate
b802ea3fa74ef1d1b34d4173b3ef1ee51724f9d6 (CLI run 38176529757). All six target
archives contain LICENSE, THIRD_PARTY_NOTICES and the corrected README. The
formula installs both notices in pkgshare. The updater checks unique nonempty
notices and identical bytes across its four archives; all 13 regressions passed.

That CLI candidate passed native Linux, macOS Homebrew, Windows PowerShell 7/5.1,
parser/failure checks and the full Scoop lifecycle. Windows validation resumed
on owner instruction. Tap syntax/style CI passed for commit 2594b4f in runs
38176888008 and 38176884728.

The final README now records Windows success, and CI uses pinned Actions plus
conditional private/public dependency access. A fresh final candidate and matching
formula comparison are being completed. Tap-owned native Linux/macOS validation
must consume the exact successful final candidate, not an earlier run. The
private read secret needs Actions read for artifacts and Contents read for
releases; public mode uses the scoped GitHub token instead.

Do not merge this formula into main or offer it as an available installation
until the matching corrected release is ready. Recommended old-release handling:
retain the v0.0.1 tag/source history and withdraw its 12 downloadable assets,
plus audited deficient historical CI package artifacts, after owner approval.
The complete evidence and proposal are in bibleit-cli docs/release-v0.0.2-readiness.md.
