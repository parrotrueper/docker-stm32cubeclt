#!/usr/bin/env bash
# Exit on error
set -e
set -u
set -o pipefail

# shellcheck source=/dev/null
. ci/functions.sh

# shellcheck source=/dev/null
. .env

# Parameters:
# - checksum value
# - filename
function CHECKMD5() {
  md5_to_test=$1
  md5_from_file=$(md5sum "$2" | cut -d " " -f1)
  md5_results="CSUM reference($md5_to_test) CSUM of File($md5_from_file)"
  if [[ $md5_to_test == "$md5_from_file" ]]; then
      info "$md5_results"
    else
      fatal 1 "$md5_results"
  fi
}

info "Checking MD5SUM of archive"
run CHECKMD5  "${CSUM}" "./${ST_ARCHIVE}"
