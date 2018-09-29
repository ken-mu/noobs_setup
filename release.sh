#!/bin/sh

set -eu

if [ $# -ne 1 ]; then
  echo argument error
  exit 1
fi

wget https://github.com/tcnksm/ghr/releases/download/v0.12.0/ghr_v0.12.0_linux_amd64.tar.gz
tar xvfz ghr_v0.12.0_linux_amd64.tar.gz

echo $1
echo $CIRCLE_PROJECT_USERNAME
echo $CIRCLE_PROJECT_REPONAME
ls -l artifacts

./ghr_v0.12.0_linux_amd64/ghr -u $CIRCLE_PROJECT_USERNAME -r $CIRCLE_PROJECT_REPONAME -replace $1 ./artifacts/
