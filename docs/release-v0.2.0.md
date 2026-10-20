# CLI v0.2.0 formula update

The formula uses the published [CLI v0.2.0](https://github.com/bibleit-labs/bibleit-cli/releases/tag/v0.2.0)
archives from source `551141d7a4b60f23c6804004a61fac87416eca6d`, with published bibleit-go v0.2.0.
The tap updater verified all four archive hashes against the release checksums and
clean manifest, matching redistribution notices, and installation of those notices
in pkgshare. Stable versions are inferred from release URLs.

| Archive | SHA-256 |
| --- | --- |
| darwin_arm64 | `fed7e86299160c8351d1ebecefa3c64557913571f9ac97f0228e8699f527e98a` |
| darwin_amd64 | `cb9b5a28c9b0952053374e51007f0b5b85b7fc49f2fcd9b702cf708c58306cd0` |
| linux_arm64 | `d6dafcce15842874b2e4de2d029bb9c1c6d03be178bf5cfaa4d156842cdfeefe` |
| linux_amd64 | `63ef94c7ba8481ecd02e5a1a3e9e0fde7a7b5d0a0d66c4f143d368adc10c7bd5` |

The [tagged release workflow](https://github.com/bibleit-labs/bibleit-cli/actions/runs/39345739770)
passed native Linux/macOS/Windows and all six CLI installer targets before publication.
All 12 public release assets were independently downloaded and verified against
GitHub digests and workflow bytes. Formula regression tests pass.

This release adds consistent command grammar/help, preferences, expanded REST
resources and cursor-paged complete-book reads. HTTP JSON retains schema version 2;
SSH/local/error JSON retains version 1. See the
[CLI REST guide](https://github.com/bibleit-labs/bibleit-cli/blob/v0.2.0/docs/rest-api.md).

The tap-owned package and anonymous-public workflows validate fresh installation,
test, reinstall, notices, completions and uninstall on native macOS/Linux amd64/arm64.
The server delivery plan records their exact runs and the real v0.1.0-to-v0.2.0
upgrade result; historical release evidence does not qualify this version.
