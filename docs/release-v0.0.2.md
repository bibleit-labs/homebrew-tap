# Private v0.0.2 formula preparation

Prepared 2026-10-11 on release/v0.0.2; main remains on v0.0.1. No existing
release assets or repository visibility settings were changed.

The proposed formula uses verified CLI v0.0.2 archive hashes from the clean
candidate source 9fb7bfc4565ffc3adacbcecf8343042e056ffc8c. It installs LICENSE and
THIRD_PARTY_NOTICES in pkgshare. The updater requires unique nonempty notices
with identical contents across the four archives and requires their installation.
Its 13 focused regression tests passed.

Tap syntax/style CI passed at
https://github.com/bibleit-labs/homebrew-tap/actions/runs/38174382048.
The tap-owned native macOS arm64 fixture passed install/test/reinstall/completions,
exact notice retention after install/reinstall, and uninstall using the exact
candidate archives and a disposable Homebrew prefix. Only download URLs were
rewritten to local files; production hashes and installation methods were retained.

The candidate build and native CLI code tests passed, but GitHub blocked the
fresh candidate installer jobs for account billing/spending-limit reasons:
https://github.com/bibleit-labs/bibleit-cli/actions/runs/38174450362.
Native Windows PowerShell 7/5.1 and Scoop checks and tap-owned Linux validation
remain required. Windows checks are held pending by owner instruction.
The public-docs update changes the README embedded in CLI archives. The current
formula therefore matches the recorded 9fb7bfc candidate only; build a fresh
candidate from the final approved source, regenerate hashes and validate that
exact formula before release. Once Actions capacity is available, use the new
successful candidate_run_id with validate-release.yml. The CLI read token needs
Actions read for candidate artifacts and Contents read for published releases.

Do not merge this formula into main or offer it as an available installation
until the matching corrected release is ready. Recommended old-release handling:
retain the v0.0.1 tag/source history and withdraw its 12 downloadable assets,
plus audited deficient historical CI package artifacts, after owner approval.
The complete evidence and proposal are in bibleit-cli docs/release-v0.0.2-readiness.md.
