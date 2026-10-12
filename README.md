# Bibleit Homebrew tap

Homebrew formulae for the [Bibleit CLI](https://github.com/bibleit-labs/bibleit-cli).
The package name is **bibleit-cli**; the executable is **bibleit**.

## Installation

The tap and CLI release assets are public. Install the verified package with:

```sh
brew install bibleit-labs/tap/bibleit-cli
bibleit version
bibleit auth login
```

The repository name homebrew-tap gives the identifier bibleit-labs/tap. The formula
selects macOS/Linux amd64/arm64 archives and installs Bash/Zsh/Fish completions,
LICENSE and THIRD_PARTY_NOTICES. Runtime binaries need no Go or Python installation;
SSH commands need OpenSSH. Supported package builds do not prove native validation
on every architecture. Account/translation access is separate from repository access.

For updates and uninstall:

```sh
brew update
brew upgrade bibleit-labs/tap/bibleit-cli
brew uninstall bibleit-cli
```

See [the CLI README](https://github.com/bibleit-labs/bibleit-cli#readme) for commands,
authentication, Windows and script installers, and compatibility limits.

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

Validate Homebrew package runs native macOS/Linux install/test/reinstall,
completions, exact notice retention and uninstall on the formula review branch.
Set candidate_run_id for a successful public CLI candidate run; omit it for a
published release. Both paths verify the branch formula against the exact inputs.

For an authorized local reviewer with RUN_ID set to a successful candidate run:

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

Anonymous install/test/reinstall/uninstall passed on macOS ARM64 and Linux x86_64
with empty caches at the standard Homebrew prefixes. See
[public launch evidence](docs/public-launch.md) and the dated
[release preparation](docs/release-readiness.md). Packaged README changes require
fresh candidate archives and matching formula hashes before release approval.

See [CONTRIBUTING.md](CONTRIBUTING.md), [workflows](.github/workflows), and
[SECURITY.md](SECURITY.md). Tap source is [MIT licensed](LICENSE); redistributed
CLI binaries also retain their own third-party notices. Software licensing does
not grant rights to Bible translations returned by the service.
