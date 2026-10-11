# Bibleit Homebrew tap

Homebrew formulae for the [Bibleit CLI](https://github.com/bibleit-labs/bibleit-cli).
The package name is **bibleit-cli**; the executable is **bibleit**.

## Availability and planned installation

The tap and CLI release assets remain **private**. Main references private
v0.0.1, whose archives lack required notices. The review branch prepares corrected
v0.0.2 with notice retention; it is not an approved release or available public
installation. [Release preparation](docs/release-v0.0.2.md) records the gates.
Making the tap public alone would not make private CLI downloads accessible.

After the matching corrected release and public access are approved:

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

For updates/uninstall after installation becomes available:

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
candidate. Use Conventional Commits such as `fix(formula): update to v0.0.2`.

While inputs are private, BIBLEIT_CLI_READ_TOKEN needs Contents read on the CLI,
plus Actions read for candidate artifacts. The updater's own job uses scoped
contents/pull-request write permissions for its branch/PR. Organization/repository
policy must permit PR creation; bot PRs may need manual validation dispatch.
Tokens are for maintainer validation, not embedded customer download credentials.

## Candidate and release validation

Validate Homebrew package runs native macOS/Linux install/test/reinstall,
completions, exact notice retention and uninstall on the formula review branch.
Set candidate_run_id for a successful private CLI candidate run; omit it for a
published release. Both paths verify the branch formula against the exact inputs.

For an authorized local reviewer with RUN_ID set to a successful candidate run:

```sh
: "${RUN_ID:?Set RUN_ID to a verified CLI candidate run}"
gh run download "$RUN_ID" --repo bibleit-labs/bibleit-cli \
  --name candidate-assets --dir artifacts/v0.0.2
python3 scripts/check_released_homebrew.py --assets artifacts/v0.0.2 \
  --formula Formula/bibleit-cli.rb --helper scripts/check_homebrew.py \
  --report artifacts/homebrew-validation.json
```

Use the matching review branch. For an approved published version, replace the
download command with gh release download for that version. Local fixtures retain
production hashes/install methods and rewrite only download URLs to local files.
The Homebrew sandbox remains enabled. This does not prove unauthenticated access.

Tap syntax/style and native macOS candidate checks passed. Native Linux CI remains
pending Actions capacity; corrected CLI Windows/Scoop checks remain pending by
owner instruction. Docs changes alter packaged README inputs, so refresh the final
candidate and formula hashes before approval. v0.0.1 validation commands are
intentionally omitted because the current verifier rejects its missing notices.

See [CONTRIBUTING.md](CONTRIBUTING.md), [workflows](.github/workflows), and
[SECURITY.md](SECURITY.md). Tap source is [MIT licensed](LICENSE); redistributed
CLI binaries also retain their own third-party notices. Software licensing does
not grant rights to Bible translations returned by the service.
