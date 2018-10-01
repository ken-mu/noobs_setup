#!/bin/sh

set -eu

if [ $# -ne 1 ]; then
  echo argument error
  exit 1
fi

wget https://github.com/tcnksm/ghr/releases/download/v0.12.0/ghr_v0.12.0_linux_amd64.tar.gz
tar xvfz ghr_v0.12.0_linux_amd64.tar.gz

echo TAG: $1
echo 'files in artifacts:'
ls -l artifacts

./ghr_v0.12.0_linux_amd64/ghr -t $GITHUB_TOKEN -u $CIRCLE_PROJECT_USERNAME -r $CIRCLE_PROJECT_REPONAME -delete $1 ./artifacts/
