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
SSH commands need OpenSSH. Using the service requires the relevant account
permissions and translation access.

For updates and uninstall:

```sh
brew update
brew upgrade bibleit-labs/tap/bibleit-cli
brew uninstall bibleit-cli
```

See [the CLI README](https://github.com/bibleit-labs/bibleit-cli#readme) for commands,
authentication, Windows and script installers, and compatibility limits.

## Shell completion

Homebrew installs Bash, Zsh and Fish completion files. Your shell must load them;
installation does not change your shell startup files. Follow the
[Homebrew completion setup](https://github.com/bibleit-labs/bibleit-cli#homebrew-shell-setup)
in the CLI guide.

## Support and contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) and the [maintainer guide](docs/maintenance.md)
for formula updates and validation. [Public launch evidence](docs/public-launch.md)
records installation checks. Intel macOS follows
[Homebrew Tier 3](https://docs.brew.sh/Support-Tiers) support.
Report vulnerabilities privately through [SECURITY.md](SECURITY.md).

Tap source is [MIT licensed](LICENSE); CLI packages retain their third-party
notices. Software licensing does not grant rights to Bible translations returned
by the service.
