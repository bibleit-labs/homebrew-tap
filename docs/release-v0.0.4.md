# v0.0.4 published formula

Published 2026-10-12 after owner approval. CLI v0.0.4 is latest stable and
[PR #15](https://github.com/bibleit-labs/homebrew-tap/pull/15) merged the formula
as `370620ac2728cdd4c9d2eabdae3f0058d2d723e9`. All twelve public release assets
match the approved candidate hashes; previous release assets remain unchanged.

The candidate source is `df1904650266cac7d15fad254589f0e729f9ef22` in bibleit-cli,
using Go 1.27.1 and the pinned public Go SDK v0.0.1. The updater verified a clean
standalone manifest, all four archive hashes and redistribution notices. All 16
verifier regression tests and Ruby syntax passed.

[CLI candidate 38275552347](https://github.com/bibleit-labs/bibleit-cli/actions/runs/38275552347)
passed all six native installer targets. Its twelve artifacts match the clean local
package byte-for-byte; the staged formula matches its verified production formula.
[Tap validation 38276244465](https://github.com/bibleit-labs/homebrew-tap/actions/runs/38276244465)
passed macOS ARM64/Intel and Linux AMD64/ARM64 on source
`faa603f4c3e7ffecbc7c7ea0d4f8f3a30ae8f720`. Checks cover install/test/reinstall/uninstall,
host and binary architecture, exact installed hashes, notices, completions, root/auth
help and preserved legacy configuration. Evidence-only changes preserve the validated
formula and helper bytes. See [the validation record](release-v0.0.4-validation.json).

The release fixes browser login waiting after authorization is denied and adds
source-build instructions. Shell completion still requires the setup documented
in the CLI README; neither installers nor this formula edit shell startup files.

[Anonymous Homebrew run 38281509948](https://github.com/bibleit-labs/homebrew-tap/actions/runs/38281509948)
passed all four native platforms at standard prefixes with empty download caches:
install/test/reinstall/uninstall, exact installed binary hashes, architecture, notices,
completions and legacy configuration preservation. All four downloaded reports were
checked against the approved executable hashes.

[Anonymous CLI run 38281676238](https://github.com/bibleit-labs/bibleit-cli/actions/runs/38281676238)
passed all six native targets after correcting a missing executable-hash lookup field
in the CLI evidence record. Release assets and validation helpers were unchanged.
All approved publication gates are complete.
