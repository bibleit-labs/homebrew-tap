# Root SDK API release coordination

The Go SDK moves resource operations and models into the root `bibleit` package.
The CLI consumes `bibleit.NewClient` for HTTP resources and
`bibleit.NewSSHClient` for SSH. This has no effect on Homebrew command names,
completion installation, service endpoints or wire output.

Release in this order:

1. Publish the updated Go SDK as an immutable version.
2. Pin that version in the CLI's `go.mod` and `go.sum`, then run standalone CLI
   tests and release validation with `GOWORK=off`.
3. Publish the validated CLI archives, manifest and checksums.txt.
4. Run the tap's `scripts/update_formula.py` with `--version vX.Y.Z --assets /path/to/release-assets`. The assets directory
   contains the manifest, checksums.txt, archives and generated formula. Run the tap tests and Homebrew
   validation before committing the resulting formula.

The v0.2.3 formula uses the generated formula and archive checksums from CLI
release workflow [39406201708](https://github.com/bibleit-labs/bibleit-cli/actions/runs/39406201708).
See [release inputs](release-v0.2.3.md) for exact source and SDK provenance.
