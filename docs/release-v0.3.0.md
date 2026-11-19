# CLI v0.3.0 release inputs

- CLI source: `3e23adf6fe10a118c71b3da5583b37ae9b41ee91`.
- SDK: [bibleit-go v0.5.0](https://github.com/bibleit-labs/bibleit-go/releases/tag/v0.5.0),
  pinned with Go module checksum `h1:ulGxMkTliMhIpJ3uHzIyM0Gr8vBpLJAISRka03PqMiA=`.
- CLI [release workflow](https://github.com/bibleit-labs/bibleit-cli/actions/runs/44560568088).
- [CLI release](https://github.com/bibleit-labs/bibleit-cli/releases/tag/v0.3.0).

The formula is generated from the clean standalone CLI release inputs and
verified by `scripts/update_formula.py` against the frozen manifest, all four
macOS/Linux archive checksums and redistribution notices.

The CLI adds Broadcast Studio Setup and lifecycle controls over REST and SSH,
with matching SDK models, workspace permissions, revision checks and retained
request files for safe reconciliation. Broadcast mutations do not automatically
retry after an uncertain response. Install methods, executable and completion
paths remain unchanged.

Release qualification:

- [Tap syntax/style and updater regressions](https://github.com/bibleit-labs/homebrew-tap/actions/runs/44562892670) passed.
- [Four native published-package lifecycle checks](https://github.com/bibleit-labs/homebrew-tap/actions/runs/44563725051) passed on macOS ARM64/Intel and Linux amd64/ARM64. GitHub could not acquire the first macOS ARM runner; the ordinary failed-job retry passed without changing inputs or checks.
- [Anonymous public installation](https://github.com/bibleit-labs/homebrew-tap/actions/runs/44568123918) passed on all four native platforms after the formula merged to main. Its first macOS ARM attempt also failed to acquire a hosted runner; the ordinary failed-job retry passed.

The public check used empty caches, ordinary unauthenticated download URLs and
standard Homebrew prefixes. Each platform verified native binary architecture,
version/help, retained licenses/notices and completions, install/test/reinstall,
and uninstall. It did not use customer credentials or create broadcasts.

Public archives, formula, manifest and checksums were byte-compared with the
reviewed immutable tag assets before formula merge. The CLI tag remains bound
to the source above; later documentation commits do not change released inputs.
