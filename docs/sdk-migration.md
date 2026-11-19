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

The v0.3.0 formula uses the immutable CLI release and bibleit-go v0.5.0,
including shared Broadcast Studio REST/SSH controls. The SDK handles exact-byte
Setup mutation payloads and typed transport results; the CLI retains credentials
and terminal/OpenSSH integration. Server permissions remain authoritative.
See [release inputs](release-v0.3.0.md) for exact source and SDK provenance.
