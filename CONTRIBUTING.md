# Contributing to the Homebrew tap

The tap is MIT licensed and public. Keep formula changes focused on a
verified CLI version and use Conventional Commits and branches without a codex
prefix. Discuss broader packaging changes first. Redact tokens/private account
or server data; report vulnerabilities through [SECURITY.md](SECURITY.md).

## Verify a formula

The CLI owns archives, checksums, provenance, notices and generated bibleit-cli.rb.
Use this tap's scripts/update_formula.py to verify all four archive hashes and the
clean/pinned-client manifest before updating the formula. The verifier rejects
missing/inconsistent notices and a formula that does not install them in pkgshare.
Never invent hashes or treat a locally dirty/workspace candidate as publishable.

```sh
python3 -B -m unittest discover -s scripts -p 'test_*.py'
: "${VERSION:?Set VERSION to the verified release tag}"
python3 scripts/update_formula.py --version "$VERSION" --assets "artifacts/$VERSION"
```

The example needs the verified assets for that release. Older notice-deficient
packages are rejected. Update both the generated formula and relevant docs together.

## Installation checks

Pushes/PRs normally run Homebrew syntax/style and updater regressions. Docs-only
changes need content/link review. The Validate Homebrew package workflow accepts
a published version or a successful public CLI candidate run ID. Candidate mode
verifies repository/workflow/event/source/version before comparing the formula
and installing local archives in disposable native macOS/Linux prefixes. Both
package validation and anonymous public validation cover macos-15,
macos-15-intel, ubuntu-24.04 and ubuntu-24.04-arm. The harness verifies native
host and installed binary architecture; Rosetta execution is rejected. Public
validation uses empty caches, ordinary public URLs and standard prefixes.

Workflows use their GitHub token for public release and candidate reads; no stored
personal access token is required. Do not put GitHub credentials in formula URLs. Review the
script/options and [maintainer guide](docs/maintenance.md) for artifact validation commands.
These checks do not establish anonymous downloads or customer installation.

Windows PowerShell 7/5.1 and Scoop checks passed on the final candidate.
The tap's native macOS/Linux lifecycle checks passed on those exact artifacts.
See [public launch evidence](docs/public-launch.md) and the dated
[release evidence](docs/release-v0.0.3.md) for source and run references. Match a
verified published release before merging formula changes. Retain the upstream MIT
notice and all binary component notices; the formula's MIT metadata does not
relicense Go dependencies or Bible translation data.
