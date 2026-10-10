# Bibleit Homebrew tap

This repository stores the Bibleit CLI formula independently from the CLI and
language clients. It uses the MIT license and Conventional Commits.

## Current status

The local `formula-preparation` branch contains a development candidate,
`0.1.0-dev.1`. Its GitHub Release URLs are placeholders for unpublished artifacts.
Do not distribute or install it using those URLs. No formula has been pushed or
published. Production endpoints, a released Go-client dependency and authorized
CLI release must precede tap publication.

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
