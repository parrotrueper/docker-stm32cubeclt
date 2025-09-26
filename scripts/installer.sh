#!/usr/bin/env bash
# Exit on error
set -e

# Error handling
trap 'printf "\n\nERROR at $0 line $LINENO. Exiting.\n\n"' ERR

# input argument is the archive name
st_sh_file=$1

tmp_dir="/tmp/st"
mkdir -p ${tmp_dir}

chmod +x "${st_sh_file}"

/usr/bin/bash "${st_sh_file}" --tar -xvf -C "${tmp_dir}/"
cd ${tmp_dir}

# installation needs to be as root
LICENSE_ALREADY_ACCEPTED=1 /usr/bin/bash ${tmp_dir}/setup.sh

# shellcheck disable=2028
echo "printf \"\n\nST tools can be found in /opt/st/\n\n\"" >> /etc/bash.bashrc

cd /

# cleanup
rm -rf ${tmp_dir}
rm -rf "${st_sh_file}"
