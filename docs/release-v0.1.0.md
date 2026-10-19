# CLI v0.1.0 formula update

The formula uses the published CLI v0.1.0 archives from source
`f67c68b7a9f77894b799dbc8fea5cbdc04f25843`, with bibleit-go v0.1.0 and no local
workspace or replacement module. The tap updater verified all four archive hashes,
matching redistribution notices and the clean, pinned release manifest.

| Archive | SHA-256 |
| --- | --- |
| darwin_arm64 | `de8f59519d0dacf44e740ea90fe57c52923879b55ca666813030c53039623b55` |
| darwin_amd64 | `2ec79157dce3fc26eb36ada5e962860483904296f6852b13142c35cd864a5f69` |
| linux_arm64 | `15a9829f93f81a4cd161426bf45f9f0a8e55a063df98d1cdcfe811a2e24e5e52` |
| linux_amd64 | `cbbc440b16d992e73de8705306b0b7ffebe308171d58ff9b94d1bab23573b650` |

[Release validation](https://github.com/bibleit-labs/bibleit-cli/actions/runs/39303755796)
passed native installation and Homebrew lifecycle checks on all four macOS/Linux
architectures. [Public CLI installer validation](https://github.com/bibleit-labs/bibleit-cli/actions/runs/39305319264)
passed all six supported platforms. These runs qualify the exact published assets;
this tap's updater regression suite and Ruby syntax check also passed.

HTTP commands now use REST v1 directly, with native data in schema-version-2 JSON.
SSH output remains schema version 1. See the
[upstream migration guide](https://github.com/bibleit-labs/bibleit-cli/blob/v0.1.0/docs/rest-api.md)
for compatibility details.
