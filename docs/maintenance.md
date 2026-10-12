# Maintaining the Homebrew tap

## Formula maintenance

The CLI generates the formula from frozen archives. This tap verifies manifest
eligibility, hashes, notice contents and installed notices. Stable versions are
inferred from release URLs; prereleases retain explicit versions. The Update
release formula workflow accepts a published version and opens a reviewable PR;
it never merges or publishes the CLI release. Do not run it for an unpublished
candidate. Use Conventional Commits such as `fix(formula): retain redistribution notices`.

Public release and candidate reads use the workflow's GitHub token; no stored
personal access token is required. The updater's own job uses scoped
contents/pull-request write permissions for its branch/PR. Organization/repository
policy must permit PR creation; bot PRs may need manual validation dispatch.
Tokens are for maintainer validation, not embedded customer download credentials.

## Candidate and release validation

Validate Homebrew package runs on macOS ARM64/Intel and Linux amd64/ARM64,
covering install/test/reinstall,
completions, exact notice retention and uninstall on the formula review branch.
Set candidate_run_id for a successful public CLI candidate run; omit it for a
published release. Both paths verify the branch formula against the exact inputs.

To validate CI artifacts locally, set `RUN_ID` to the successful candidate workflow run and check out the matching formula review branch:

```sh
: "${RUN_ID:?Set RUN_ID to a verified CLI candidate run}"
gh run download "$RUN_ID" --repo bibleit-labs/bibleit-cli \
  --name candidate-assets --dir artifacts/candidate
python3 scripts/check_released_homebrew.py --assets artifacts/candidate \
  --formula Formula/bibleit-cli.rb --helper scripts/check_homebrew.py \
  --report artifacts/homebrew-validation.json
```

Use the matching review branch. For an approved published version, replace the
download command with gh release download for that version. Local fixtures retain
production hashes/install methods and rewrite only download URLs to local files.
The Homebrew sandbox remains enabled. This does not prove unauthenticated access.

Anonymous install/test/reinstall/uninstall passed on macOS ARM64/Intel and
Linux amd64/ARM64 with empty caches at the standard Homebrew prefixes. The
harness verifies host and installed binary architectures and rejects Rosetta.
Intel macOS remains [Homebrew Tier 3](https://docs.brew.sh/Support-Tiers). See
[public launch evidence](public-launch.md) and the dated
[release evidence](release-v0.0.3.md). Packaged README changes require
fresh candidate archives and matching formula hashes before release approval.

## Launch and audit evidence

[Public launch evidence](public-launch.md) records installation checks, repository
protections and completed publication actions. Use the dated release reports for
the exact tested inputs; passing historical checks does not qualify a new formula.
The CLI's [security audit](https://github.com/bibleit-labs/bibleit-cli/blob/main/docs/security-audit.md)
and [licensing audit](https://github.com/bibleit-labs/bibleit-cli/blob/main/docs/licensing-audit.md)
cover the shared distribution review. Keep raw credentials and unredacted reports
outside Git; report vulnerabilities through [SECURITY.md](../SECURITY.md).
