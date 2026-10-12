# v0.0.3 published formula

Published 2026-10-12 after owner approval. The live tap installs v0.0.3.
[PR #11](https://github.com/bibleit-labs/homebrew-tap/pull/11) was squash-merged
through protection at `65bff4e45fa8075619ec7afc47b1f4f70c1eeb31`, using the exact
normalized CLI-generated formula and its four verified archive hashes.

[CLI candidate 38244704911](https://github.com/bibleit-labs/bibleit-cli/actions/runs/38244704911)
passed all six native targets from source `0e1fc6f0b1a1cb734f5b54827f7e0319bb9f3280`.
[Tap run 38245499054](https://github.com/bibleit-labs/homebrew-tap/actions/runs/38245499054)
passed native macOS ARM64/Intel and Linux AMD64/ARM64. All installed binary hashes
match the frozen candidate. Checks include install/test/reinstall/uninstall,
notice retention, completion files, host/binary architecture and auth help with
an unchanged legacy configuration. Core metadata is seeded from an available
runner cache or shallow public checkout before the lifecycle, avoiding full-core
clones during uninstall. Normal Homebrew sandboxing remains enabled.

The [validation record](release-v0.0.3-validation.json) binds the exact archives,
production formula and validation helper. The evidence-only follow-up preserves
those validated bytes. Intel macOS remains [Homebrew Tier 3](https://docs.brew.sh/Support-Tiers).

## Publication and anonymous checks

[The CLI release](https://github.com/bibleit-labs/bibleit-cli/releases/tag/v0.0.3) is latest stable with title `v0.0.3`. All twelve
published assets were downloaded anonymously and matched the approved hashes and
provenance before the tap merge. Older releases are unchanged.

[Public Homebrew validation](https://github.com/bibleit-labs/homebrew-tap/actions/runs/38248930792) passed on all four native targets
at standard prefixes, using empty download caches and public URLs without
credentials or local archive overrides. Checks cover install/test/reinstall/uninstall,
native binary headers and approved hashes, retained notices, Bash/Zsh/Fish completion
files, current root/auth help and an unchanged legacy configuration.
[Public script installers](https://github.com/bibleit-labs/bibleit-cli/actions/runs/38249509803) also passed on all six native targets,
including Windows ARM64 PowerShell 7 and 5.1. The real local Homebrew upgrade from
v0.0.2 to v0.0.3 passed while preserving user configuration and shell startup files.

No publication or installation gate remains pending. Intel macOS remains Homebrew
Tier 3. Signing/notarization and a public Scoop bucket are separate work. The SDK
release is unchanged and the private service repository remains private.
