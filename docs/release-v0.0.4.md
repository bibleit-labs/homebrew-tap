# v0.0.4 staged formula

This formula is staged on an unmerged review branch. The live tap remains on
v0.0.3. Publishing v0.0.4 and merging this formula require owner approval.

The candidate source is `df1904650266cac7d15fad254589f0e729f9ef22` in bibleit-cli,
using Go 1.27.1 and the pinned public Go SDK v0.0.1. The updater verified a clean
standalone manifest, all four archive hashes and redistribution notices. All 16
verifier regression tests and Ruby syntax passed.

[CLI candidate 38275552347](https://github.com/bibleit-labs/bibleit-cli/actions/runs/38275552347)
will qualify the exact v0.0.4 archives on six native platforms. Compare its
artifacts with the locally staged hashes before running the four native Homebrew
lifecycle checks. Until those results are recorded, this is preparation evidence.

The release fixes browser login waiting after authorization is denied and adds
source-build instructions. Shell completion still requires the setup documented
in the CLI README; neither installers nor this formula edit shell startup files.

After approval, publish the exact reviewed CLI assets, verify their anonymous
availability and hashes, then merge this formula and run anonymous Homebrew
installation checks. Keep existing releases immutable.
