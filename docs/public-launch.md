# Public launch evidence

Completed 2026-10-12 in SDK → CLI → tap order after owner approval. The tap,
SDK and corrected CLI release are public. The service implementation repository
stays private; its public client guides and rendered command protocol are deployed and verified.
Server Markdown and HTTP/WebSocket implementation guides are excluded. Main and v* release tags have active protection
rulesets without bypass actors. Main requires a reviewed PR path, current test-bot
checks, resolved discussions and linear history; force pushes/deletion and tag
update/deletion are blocked. Zero required approvals supports the sole maintainer.
Secret scanning, push protection, dependency alerts and private vulnerability
reporting are enabled. The scoped formula updater still opens PRs without merging.

The formula uses immutable corrected v0.0.2 archives. All eight package hashes and
the normalized formula exactly matched the frozen candidate after final-source
release validation. The 12 deficient v0.0.1 downloads and 38 exact historical CI
artifacts were withdrawn after backup verification; the old source/tag remain.

[Normal public Homebrew validation](https://github.com/bibleit-labs/homebrew-tap/actions/runs/38234257265)
passed on all four native targets:

| Host | Runner | Standard prefix |
| --- | --- | --- |
| macOS ARM64 | macos-15 | /opt/homebrew |
| macOS Intel amd64 | macos-15-intel | /usr/local |
| Linux amd64 | ubuntu-24.04 | /home/linuxbrew/.linuxbrew |
| Linux ARM64 | ubuntu-24.04-arm | /home/linuxbrew/.linuxbrew |

Each job passed installation, brew test, reinstall, version/help, exact notices,
all three completions and uninstall. Install and reinstall began with empty
caches, without credentials, local archive URL overrides or custom prefixes.
The harness verifies the requested native host and installed ELF/Mach-O
architecture and rejects Rosetta execution. See the
[native reports summary](native-homebrew-2026-10-12.json) for binary hashes
and original report digests. Intel macOS remains
[Homebrew Tier 3](https://docs.brew.sh/Support-Tiers); these passing package
checks do not change Homebrew's support policy.

The separate [published-package fixture checks](https://github.com/bibleit-labs/homebrew-tap/actions/runs/38234262821)
also passed on all four native targets, with installed binary hashes matching
the anonymous installations. The tap formula and release assets are unchanged.

[Full CLI launch evidence](https://github.com/bibleit-labs/bibleit-cli/blob/main/docs/public-launch.md)
records release provenance, public Bash/PowerShell coverage, actual settings and
security/log checks. Package signing/notarization and a public Scoop bucket are
outside this release. Existing releases remain immutable; updated main README
copy will enter a future package release. The obsolete private CLI read-secret
copy was removed after checking repository/workflow references and the owner
confirmed the token was not reused elsewhere. Release/candidate reads use the
generated workflow token; no stored PAT is required. The underlying account tokens
were subsequently identified, their repository permissions checked, and both
revoked in owner-authenticated GitHub settings. See the
[cleanup assessment](https://github.com/bibleit-labs/bibleit-cli/blob/main/docs/security/private-read-secret-cleanup-2026-10-12.json).

## Next formula: staged, awaiting approval

The [v0.0.3 staged formula](release-v0.0.3.md) passed all four native Homebrew
lifecycles against the successful frozen CLI candidate. [PR #11](https://github.com/bibleit-labs/homebrew-tap/pull/11)
remains unmerged. The live formula and existing release assets remain unchanged.
Anonymous v0.0.3 installation requires the approved CLI publication and tap merge.
