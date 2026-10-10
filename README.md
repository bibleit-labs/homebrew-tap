# Bibleit Homebrew tap

This repository stores the Bibleit CLI formula independently from the CLI and
language clients. It uses the MIT license and Conventional Commits.

## Current status

The `formula-preparation` branch contains a development candidate,
`0.1.0-dev.1`. Its GitHub Release URLs are placeholders for unpublished artifacts.
Do not distribute or install it using those URLs. Source branch pushes to the
private repository are authorized as of 2026-10-11; customer package publication
remains gated. Production endpoints, a released Go-client dependency and a
CLI release must precede a customer-ready tap. Private GitHub access alone does
not make the release archives available to unauthenticated customers.

Once an authorized release exists, the customer command will be:

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
version and SHA-256 checksums. Copy the reviewed released formula to
`Formula/bibleit-cli.rb`. Check all four macOS/Linux architecture URLs and hashes,
license, installed completions and the version test. Use an independent commit
such as `chore(formula): update bibleit-cli to 0.1.0`.

Validate a local candidate from the sibling CLI repository without installing
anything into the user's normal Homebrew prefix:

```sh
python3 scripts/check_homebrew.py --assets build/releases/v0.1.0-dev.1 \
  --formula ../homebrew-tap/Formula/bibleit-cli.rb
```

The runner creates a disposable Homebrew prefix and tap, rewrites only archive
URLs to local files, and checks actual install/test/completions/reinstall/uninstall.
Only publish the production formula after its CLI release is available. Updating
this repository does not tag or release the CLI or Go client.

## CI and reviewed release updates

`tests.yml` runs on pushes, pull requests and manual dispatch: Homebrew
`brew test-bot --only-tap-syntax` checks syntax/style, and seven Python regressions
check release version validation, corruption, checksums and formula URLs. This
workflow does not download the unpublished development candidate. Actual install,
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

Setup status (2026-10-11): repository PR creation is currently blocked by the
organization policy; the scoped read secret is not yet configured. The authenticated
setup session cannot change organization policy because it lacks `admin:org`.
