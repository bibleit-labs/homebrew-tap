# Bibleit Homebrew tap

Homebrew formulae for the [Bibleit CLI](https://github.com/bibleit-labs/bibleit-cli).
The package is **`bibleit-cli`**; the installed executable is **`bibleit`**.

## Installation

The tap contains the **v0.0.1** formula. The tap and CLI release assets are
currently private. The commands below become available to unauthenticated users
after public access is enabled; fresh public installation checks are pending.

```sh
brew install bibleit-labs/tap/bibleit-cli
```

Alternatively, add the tap first:

```sh
brew tap bibleit-labs/tap
brew install bibleit-cli
```

The fully qualified command selects this formula explicitly. The repository name
`homebrew-tap` gives the tap identifier `bibleit-labs/tap`.
The formula supports macOS/Linux on amd64 and arm64 and installs Bash, Zsh, and
Fish completions. Homebrew trust policy may require explicitly trusting a newly added tap.

```sh
bibleit version
bibleit auth login
```

See the [CLI documentation](https://github.com/bibleit-labs/bibleit-cli#readme)
for authentication, commands, Windows installers, and other installation methods.

## Updating and uninstalling

Once release access is available:

```sh
brew update
brew upgrade bibleit-labs/tap/bibleit-cli
brew uninstall bibleit-cli
```

## Maintaining the formula

The CLI release workflow generates archives, checksums, a release manifest, and
`bibleit-cli.rb`. This tap's updater verifies those published files and opens a
reviewable pull request; it never merges automatically or publishes CLI releases.
Stable formula versions are inferred from verified release URLs. Prerelease
versions remain explicit.

Run the **Update release formula** workflow with a published CLI version. Review all
four macOS/Linux architecture URLs and hashes, installed completions, and the
version test before merging. Use Conventional Commits, for example
`chore(formula): update bibleit-cli to v0.0.1`.

While the CLI is private, the tap needs an Actions secret named
`BIBLEIT_CLI_READ_TOKEN` with Contents: read access only to `bibleit-cli`.
Organization and repository Actions policy must permit pull request creation.
The updater requests contents-write and pull-requests-write for its update job;
it does not approve reviews. Updates created with `GITHUB_TOKEN` may require
manual CI dispatch or approval before validation runs.

## Validation

Pushes and pull requests run Homebrew syntax/style checks and Python updater
regressions. The manual **Validate released Homebrew package** workflow runs native
macOS/Linux install, version, completion, reinstall, and uninstall checks against
authenticated release downloads. Run it on the formula pull request's branch
before merging.

To validate locally with an authorized GitHub account:

```sh
gh release download v0.0.1 --repo bibleit-labs/bibleit-cli --dir artifacts/v0.0.1
python3 scripts/check_released_homebrew.py --assets artifacts/v0.0.1 \
  --formula Formula/bibleit-cli.rb --helper scripts/check_homebrew.py \
  --report artifacts/homebrew-validation.json
```

The validator checks the published formula and archive checksums, then uses
local-file fixtures in an isolated Homebrew prefix. The Homebrew sandbox stays
enabled. These checks do not prove unauthenticated access to private release URLs.
The v0.0.1 published-package checks passed on macOS and Linux; fresh public installs
remain a separate launch check.

For workflow names and inputs, see [.github/workflows](.github/workflows).
See [contributing](CONTRIBUTING.md) and [Homebrew tap documentation](https://docs.brew.sh/Taps).
Licensed under [MIT](LICENSE).
