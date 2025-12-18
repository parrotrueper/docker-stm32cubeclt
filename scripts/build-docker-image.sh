#!/usr/bin/env bash
# Exit on error
set -e
set -u
set -o pipefail

# shellcheck source=/dev/null
. ci/functions.sh

# shellcheck source=/dev/null
. .env

file_sh=${ST_ARCHIVE%.*}
info "looking for ${file_sh}"

if [[ ! -f "./src/docker-data/${file_sh}" ]]; then
	fatal 1 "did not find src/docker-data/${file_sh}"
else
	info "found"
fi

bld_cmd="docker build"
bld_cmd+=" --no-cache"
bld_cmd+=" --file ${DKR_FILE:?}"
bld_cmd+=" --build-arg ST_INSALLER=${file_sh}"
bld_cmd+=" -t ${DKR_IMG_NAME:?}"
#bld_cmd+=" --progress=plain"
bld_cmd+=" ${DKR_BUILD_CONTEXT:?}"

info "${bld_cmd}"
run eval "${bld_cmd}"
