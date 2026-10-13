# v0.0.5 formula evidence

The formula update uses [CLI v0.0.5](https://github.com/bibleit-labs/bibleit-cli/releases/tag/v0.0.5),
frozen source `562798043308e3f1f6f2eafc4ebdad52ed6758d3`, Go 1.27.1 and the
checksummed public Go SDK v0.0.2. Organization list and application status commands
are read-only and detect older servers before sending unsupported requests.

The CLI's [guarded release workflow](https://github.com/bibleit-labs/bibleit-cli/actions/runs/38328017189)
validates all six native packages before draft creation. All twelve published assets match the clean main build byte-for-byte. The updater
verified all four archive hashes, standalone provenance and redistribution notices;
16 verifier regression tests and Ruby syntax passed. Native and anonymous Homebrew
installation results remain pending.
