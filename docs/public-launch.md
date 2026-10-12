# Public launch evidence

Completed 2026-10-12 in SDK → CLI → tap order after owner approval. The tap,
SDK and corrected CLI release are public; bibleit-server stays private and its
docs PR is still draft/unmerged. Main and v* release tags have active protection
rulesets without bypass actors. Main requires a reviewed PR path, current test-bot
checks, resolved discussions and linear history; force pushes/deletion and tag
update/deletion are blocked. Zero required approvals supports the sole maintainer.
Secret scanning, push protection, dependency alerts and private vulnerability
reporting are enabled. The scoped formula updater still opens PRs without merging.

The formula uses immutable corrected v0.0.2 archives. All eight package hashes and
the normalized formula exactly matched the frozen candidate after final-source
release validation. The 12 deficient v0.0.1 downloads and 38 exact historical CI
artifacts were withdrawn after backup verification; the old source/tag remain.

[Normal public Homebrew validation](https://github.com/bibleit-labs/homebrew-tap/actions/runs/38221961063)
passed native macOS ARM64 and Linux x86_64 installation, brew test, reinstall,
version/help, exact notices, all three completions and uninstall. Install and
reinstall began with empty caches at the standard /opt/homebrew and
/home/linuxbrew/.linuxbrew prefixes. There were no credentials, local archive
URL overrides or custom prefixes. Native Intel macOS/Linux ARM64 Homebrew is
not claimed; their archive hashes/content passed separately.

[Full CLI launch evidence](https://github.com/bibleit-labs/bibleit-cli/blob/main/docs/public-launch.md)
records release provenance, public Bash/PowerShell coverage, actual settings and
security/log checks. Package signing/notarization and a public Scoop bucket are
outside this release. Existing releases remain immutable; updated main README
copy will enter a future package release. Optional private read secrets are
retained pending separate cleanup/owner token-use assessment.
