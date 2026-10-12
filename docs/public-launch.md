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

## CLI v0.0.3 formula — published and verified

Owner-approved publication completed on 2026-10-12. [v0.0.3](https://github.com/bibleit-labs/bibleit-cli/releases/tag/v0.0.3) is latest
stable with title `v0.0.3`; all twelve assets and provenance matched the approval
record on anonymous retrieval. [PR #11](https://github.com/bibleit-labs/homebrew-tap/pull/11)
merged the exact normalized formula through protection at
`65bff4e45fa8075619ec7afc47b1f4f70c1eeb31`.

[Anonymous Homebrew checks](https://github.com/bibleit-labs/homebrew-tap/actions/runs/38248930792) passed native macOS ARM64/Intel and
Linux AMD64/ARM64, using empty caches, public URLs and normal prefixes.
Install/test/reinstall/uninstall, native architecture, approved executable hashes,
notice retention, completions and root/auth help passed with legacy configuration
preserved. [Anonymous script installers](https://github.com/bibleit-labs/bibleit-cli/actions/runs/38249509803) passed all six targets,
including Windows AMD64/ARM64 PowerShell 7 and 5.1. The local real Homebrew upgrade
from v0.0.2 to v0.0.3 also passed without changing credential or shell files.
See [release evidence](release-v0.0.3.md) and
[the publication record](release-v0.0.3-validation.json).

The README now focuses on installation, updates, completion setup and support.
CI artifact review commands live in [the maintainer guide](maintenance.md).
No publication or installation gate remains pending. Older releases are unchanged;
the private service repository remains private. Intel macOS remains Homebrew Tier 3;
signing/notarization and a public Scoop bucket are separate work.
