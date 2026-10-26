# CLI v0.2.4 release inputs

- CLI source: `d38e03eca823a073c2a87646498874f277e9cff8`.
- SDK: [bibleit-go v0.3.1](https://github.com/bibleit-labs/bibleit-go/releases/tag/v0.3.1),
  pinned with Go module checksum `h1:rQW3u2lU0yAtFoM6tPhKL364Bc84MPd3vcw+DqdcLFI=`.
- CLI [release workflow](https://github.com/bibleit-labs/bibleit-cli/actions/runs/40347134923).
- [CLI release](https://github.com/bibleit-labs/bibleit-cli/releases/tag/v0.2.4).

The formula is generated from the clean standalone CLI release inputs and
verified by `scripts/update_formula.py` against the frozen manifest, all four
macOS/Linux archive checksums and redistribution notices.

The CLI adopts the SDK's typed query helpers and default options for Live
polling and whole-book iteration. Command behavior and output schemas remain
unchanged. Install methods, executable and completion paths are unchanged.
