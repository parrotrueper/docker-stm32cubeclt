#!/usr/bin/env bash
# Exit on error
set -e
set -u
set -o pipefail

# shellcheck source=/dev/null
. ci/functions.sh

# shellcheck source=/dev/null
. .env

run mkdir -p src/docker-data
run cp -p scripts/installer.sh src/docker-data/
run unzip "${ST_ARCHIVE:?}" -d src/docker-data/
run chmod +x src/docker-data/*
