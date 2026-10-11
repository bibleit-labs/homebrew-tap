# Bibleit Homebrew tap

This repository stores the Bibleit CLI formula independently from the CLI and
language clients. It uses the MIT license and Conventional Commits.

## Current status

The `main` branch contains the verified `v0.0.1` formula. Go client and CLI
`v0.0.1` releases are published in private repositories; this tap remains private.
The updater verified the actual published archives and opened PR1, which was
reviewed and merged after syntax/style, ten updater regressions and native
macOS/Linux install/test/completion/reinstall/uninstall checks passed.

Private GitHub access does not make archive URLs available to unauthenticated
customers. After public release access is enabled, the customer command is:

```sh
brew install bibleit-labs/tap/bibleit-cli
```

The package is `bibleit-cli`, while the executable is `bibleit`. Keeping this
repository named `homebrew-tap` gives the tap identifier `bibleit-labs/tap`.
The Resend-style `/cli/` path would require `homebrew-cli`; a repository named
`homebrew-taps` would give `/taps/` instead.

For a short formula name, users can first tap this repository and trust the
formula on Homebrew versions that require explicit trust, then install
`bibleit-cli`. A bare installation on a fresh machine requires future inclusion
in `homebrew/core`; it is not provided by creating this tap. The fully qualified
command above is the supported one-step path after publication.
See [Homebrew taps](https://docs.brew.sh/Taps) and
[Resend's example](https://github.com/resend/homebrew-cli).

## Formula updates

The separate `bibleit-cli` repository generates `bibleit-cli.rb` from the release
version and SHA-256 checksums. The updater verifies the released formula and archives, then writes
`Formula/bibleit-cli.rb`. Stable formulas omit the redundant explicit version
line after verification; prerelease versions remain explicit. Check all four macOS/Linux architecture URLs and hashes,
license, installed completions and the version test. Use an independent commit
such as `chore(formula): update bibleit-cli to v0.0.1`.

Validate authenticated, downloaded release assets from this tap checkout:

```sh
gh release download v0.0.1 --repo bibleit-labs/bibleit-cli --dir build/releases/v0.0.1
python3 scripts/check_released_homebrew.py --assets build/releases/v0.0.1 \
  --formula Formula/bibleit-cli.rb --helper scripts/check_homebrew.py \
  --report build/validation/homebrew.json
```

The tap owns the installation validator, derived from CLI v0.0.1 checks. It
verifies the published formula and archive hashes before making disposable
local-file URLs and preserving the verified version in that fixture. Linux
prepares core metadata before the sandboxed installation and excludes runner
Git credentials from the Git process. The sandbox remains enabled. These checks
use an isolated prefix; they do not prove public access to private release URLs.
Updating this repository does not tag or release the CLI or Go client.

## CI and reviewed release updates

`tests.yml` runs on pushes, pull requests and manual dispatch: Homebrew
`brew test-bot --only-tap-syntax` checks syntax/style, and ten Python regressions
check release version validation, corruption, checksums and formula URLs. This
workflow checks formula syntax/style without downloading its archives. Actual install,
reinstall, completion and uninstall checks run in the CLI candidate workflow;
repeat installation against customer-accessible published URLs before launch.

`update-formula.yml` is manually dispatched with a published CLI version. It
downloads four macOS/Linux archives plus checksums, manifest.json and the
CLI-generated bibleit-cli.rb, verifies a clean production manifest and all archive
hashes/URLs, then opens a release/vX.Y.Z PR against the current default branch.
It uses Conventional Commits and never auto-merges or publishes CLI assets.
An unchanged formula is a no-op; existing release branches require review rather
than force-pushing. Do not invoke it for development-only candidates.

Before using the updater:

- Publish all required generated metadata/formula alongside the CLI archives.
- While CLI is private, configure BIBLEIT_CLI_READ_TOKEN in this tap with Contents:
  read access only to bibleit-cli; the tap's own GITHUB_TOKEN does not grant cross-
  repository private access. Public CLI releases need no additional read token.
- Permit Actions to create pull requests in repository/org policy; the workflow
  requests contents-write and pull-requests-write only for its update job.
- Review the resulting PR and run/approve its validation before merging. Token-
  created pushes do not automatically run push CI; PR validation may need approval
  or a manual dispatch. The updater does not approve reviews or merge PRs.

Inspired by [Resend's release updater](https://github.com/resend/homebrew-cli/blob/main/.github/workflows/publish-release.yml).

### Private access setup and verification

Create a fine-grained token owned by `bibleit-labs`, selecting only `bibleit-cli`
and granting Contents: read-only. Save it as the tap repository's Actions secret
`BIBLEIT_CLI_READ_TOKEN`. If organization approval is required, approve the token
before testing. Set an expiration and rotate the secret before it expires; do not
store a personal token with access to all repositories in this secret.

The organization must allow GitHub Actions to create and approve pull requests
under Settings → Actions → General → Workflow permissions. Then enable the same
setting in this tap. Keep default workflow permissions read-only; only the updater
job requests contents-write and pull-requests-write. GitHub combines creation and
approval in one setting, but this workflow only creates a PR for human review.

Run the read-only **Check updater access** workflow after configuring or rotating
the secret. It verifies private CLI metadata and release-list access, including
when there are no releases yet. The updater runs the same check before downloading
assets. Neither the access check nor tap validation creates tags, releases or PRs.
A successful check proves release read access, not asset integrity or PR creation;
the first real released formula update must verify those remaining steps.

Setup status (2026-10-11): repository Actions PR creation is enabled and default
workflow permissions remain read-only, verified through the GitHub API. The scoped
read secret is configured. Private CLI metadata and release-list access passed
using the Actions secret at bf6a46b in
[run 38092683138](https://github.com/bibleit-labs/homebrew-tap/actions/runs/38092683138).
The user confirmed the token selects only bibleit-cli with Contents: read-only;
the access check proves read access without inspecting the token's full scope.
Homebrew syntax/style and seven updater regressions pass at 04e8b16 in
[run 38092320412](https://github.com/bibleit-labs/homebrew-tap/actions/runs/38092320412).

## Master and release validation

`main` is the integration/default branch. Source promotion does not publish
package URLs. The draft formula remains unavailable until a real CLI release.

After publishing an approved CLI release, dispatch **Update release formula**
with its tag. Review its `release/vX.Y.Z` PR, then run **Validate released Homebrew
package** on that PR branch with the same tag before merging. It checks the published archive hashes, standalone-client manifest and verified
formula identity, then uses the tap-owned validator for isolated
install/test/completion/reinstall/uninstall
checks on macOS and Linux. The private CLI read secret and Actions PR permissions
are already configured; the read-only access workflow can be rerun after rotation.
These checks download authenticated assets locally; customer installation from
private GitHub URLs still needs a separate public-distribution/access decision.
The supported customer command remains `brew install bibleit-labs/tap/bibleit-cli`.

Main setup verification (2026-10-11): tap validation passes at a41e453 in
[run 38158709825](https://github.com/bibleit-labs/homebrew-tap/actions/runs/38158709825),
and private CLI access passes in
[run 38158727488](https://github.com/bibleit-labs/homebrew-tap/actions/runs/38158727488).
All eight updater regressions pass. The strengthened updater also accepts and
verifies the actual clean standalone CLI candidate from run 38158698450, including
its pinned client checksum and four formula archive hashes. These are candidate
checks; no released formula update or customer-access validation is claimed.


### v0.0.1 release verification

Updater38166255153 verified the published assets and opened
[PR1](https://github.com/bibleit-labs/homebrew-tap/pull/1). Final source61dcf0c
passes tap validation38167419995 and both published-package jobs in38167449364.
The PR merged as e0db882; its merged release branch is deleted. Earlier failed
checkout, audit and local-file/Linux sandbox fixtures were corrected before merge.
CLI release assets remain unchanged. Public installation awaits the access decision.
