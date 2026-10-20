# CLI v0.2.3 release inputs

- CLI source: `0f8f8c232ad1286bfecbd29002234610d5358d74`.
- SDK: [bibleit-go v0.3.0](https://github.com/bibleit-labs/bibleit-go/releases/tag/v0.3.0),
  pinned with Go module checksum `h1:7HdO69QmQZIT5YbAm0XC+OTIpH4L/5LJsI4QOnqsK24=`.
- CLI [release workflow](https://github.com/bibleit-labs/bibleit-cli/actions/runs/39406201708).
- [CLI release](https://github.com/bibleit-labs/bibleit-cli/releases/tag/v0.2.3).

The formula is generated from the clean standalone CLI release inputs and
verified by `scripts/update_formula.py` against the frozen manifest, all four
macOS/Linux archive checksums and redistribution notices. Its install methods,
package name, executable and completion paths are unchanged.

The CLI uses the SDK's root resource API (`bibleit.NewClient`) and separate
SSH client (`bibleit.NewSSHClient`). CLI commands, endpoints and wire output
schemas are unchanged. See [SDK migration](sdk-migration.md).
