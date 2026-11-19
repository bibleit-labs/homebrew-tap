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

Release qualification evidence will be recorded after the immutable public
assets and this formula pass the native packaging and anonymous installation
checks. Historical validations do not qualify v0.3.0.
