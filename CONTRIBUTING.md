# Contributing to the Homebrew tap

The tap is MIT licensed and remains private. Keep formula changes focused on a
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
python3 scripts/update_formula.py --version v0.0.2 --assets artifacts/v0.0.2
```

The example needs verified v0.0.2 inputs. Main remains on private v0.0.1; the review
branch stages corrected v0.0.2. Older notice-deficient packages are intentionally
rejected. Update both the generated formula and relevant docs together.

## Installation checks

Pushes/PRs normally run Homebrew syntax/style and updater regressions. Docs-only
changes need content/link review. The Validate Homebrew package workflow accepts
a published version or a successful private CLI candidate run ID. Candidate mode
verifies repository/workflow/event/source/version before comparing the formula
and installing local archives in disposable native macOS/Linux prefixes.

The private CLI read secret needs Contents read for releases and Actions read for
candidate artifacts. Do not put GitHub credentials in formula URLs. Review the
script/options and [README](README.md) for authenticated fixture commands.
These checks do not establish anonymous downloads or customer installation.

Windows installer/Scoop checks resumed and passed on the documentation candidate.
The tap's native macOS check passed previously; final native Linux/macOS validation
is being completed. Do not publish,
merge the staged formula, change visibility or withdraw old assets without approval.
Match the approved release artifacts before merging. Retain the upstream MIT
notice and all binary component notices; the formula's MIT metadata does not
relicense Go dependencies or Bible translation data.
