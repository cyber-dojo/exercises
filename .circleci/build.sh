#!/bin/bash
set -ev

readonly GITHUB_ORG=https://raw.githubusercontent.com/cyber-dojo
readonly CREATE_IMAGE_SCRIPT=cyber_dojo_start_points_create.sh
readonly TMP_DIR=$(mktemp -d /tmp/cyber-dojo-exercises.XXXXXXXXX)

remove_tmp_dir() { rm -rf ${TMP_DIR} > /dev/null; }
trap remove_tmp_dir EXIT

cd ${TMP_DIR}
curl -O --silent "${GITHUB_ORG}/starter-base/master/${CREATE_IMAGE_SCRIPT}"
chmod 700 ./${CREATE_IMAGE_SCRIPT}

./${CREATE_IMAGE_SCRIPT} \
    cyberdojo/exercises \
      --exercises \
        https://github.com/cyber-dojo/exercises.git