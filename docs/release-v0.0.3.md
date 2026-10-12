# v0.0.3 staged formula

Prepared 2026-10-12; awaiting owner approval. The live tap remains v0.0.2.
[PR #11](https://github.com/bibleit-labs/homebrew-tap/pull/11) stages the exact
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

Approve the [CLI publication actions](https://github.com/bibleit-labs/bibleit-cli/blob/main/docs/release-v0.0.3-readiness.md)
before merging. First publish the reviewed CLI assets with release title `v0.0.3`,
verify anonymous download hashes, then squash-merge this PR through protection
using `chore(formula): update bibleit-cli to v0.0.3`. Run the public Homebrew workflow
on all four native targets after the merge. No source/dependency changes require
an SDK release. Keep older assets immutable and the private service repository private.
