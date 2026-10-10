#!/usr/bin/env bash
set -euo pipefail

# Metadata access alone does not prove permission to read private releases.
if ! gh api repos/bibleit-labs/bibleit-cli --silent
then
  echo '::error::Cannot access bibleit-cli. For private CLI access, configure BIBLEIT_CLI_READ_TOKEN in homebrew-tap, scoped only to bibleit-cli with Contents: read.' >&2
  exit 1
fi
if ! gh api 'repos/bibleit-labs/bibleit-cli/releases?per_page=1' --silent
then
  echo '::error::Cannot read CLI releases. Check the read token contents permission, expiration and organization approval.' >&2
  exit 1
fi
echo 'CLI release read access verified; no release or repository was changed.'
