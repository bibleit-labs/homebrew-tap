# Private corrected formula preparation

Prepared 2026-10-11 on release/v0.0.2. Main and all repositories remain private;
no merge, release/tag, old-asset or visibility changes were made.

The formula matches frozen CLI source f0c080c1505346aee78dde9e0e24f80bb9d76a74,
[successful candidate run 38177668163](https://github.com/bibleit-labs/bibleit-cli/actions/runs/38177668163).
All six archives contain exact LICENSE, THIRD_PARTY_NOTICES and the version-free
README. The formula installs both notices in pkgshare. The updater rejects
missing/inconsistent notices; all 13 regressions passed.

[Tap native validation 38178224204](https://github.com/bibleit-labs/homebrew-tap/actions/runs/38178224204)
passed at ab1fc27f1ef7b3722ac6a5648df1949d30072a96 on Darwin arm64 and Linux x86_64.
Both jobs verified candidate provenance, archive hashes and exact formula, then
install/test/reinstall, completions, exact notices and uninstall in isolated
prefixes. Formula SHA256: 4bc0c10b2c36daf838240a2d11685bfcccbf240eeb039497124f289e9364fc1a.
Syntax/style run 38178072711 passed. The CLI candidate also passed native Windows
AMD64 PowerShell 7/5.1 and Scoop checks. Follow-up CLI source cbe588d passed
[run 38179740828](https://github.com/bibleit-labs/bibleit-cli/actions/runs/38179740828),
including native ARM64 PowerShell 7/5.1 and Scoop. All eight package hashes are
unchanged and the verifier generates this exact formula; no hash update is needed.

The private token now has working Actions/Contents read access. Permission
preflight occurs before Homebrew setup; artifact download follows setup because
setup replaces the checkout. Public mode uses the scoped GitHub token. Public
anonymous downloads and normal-prefix installation remain approved-cutover checks.

Do not merge until the matching corrected release is approved and available.
Recommended old-release handling: preserve v0.0.1 tag/source history, withdraw its
12 assets and audited deficient historical CI artifacts after owner approval.
The complete hashes, native evidence and cleanup proposals are recorded in
bibleit-cli docs/release-v0.0.2-readiness.md. Later evidence-only documentation
commits do not alter the tested formula or packaged inputs.
