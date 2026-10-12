#!/usr/bin/env bash
set -euo pipefail

# Verify both the public repository and its published release metadata.
if ! gh api repos/bibleit-labs/bibleit-cli --silent
then
  echo '::error::Cannot access the public bibleit-cli repository. Check GitHub availability and workflow token permissions.' >&2
  exit 1
fi
if ! gh api 'repos/bibleit-labs/bibleit-cli/releases?per_page=1' --silent
then
  echo '::error::Cannot read public CLI releases. Check GitHub availability and workflow token permissions.' >&2
  exit 1
fi
echo 'CLI release read access verified; no release or repository was changed.'
