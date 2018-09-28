#!/bin/sh

set -eu

if [ $# -ne 1 ]; then
  echo argument error
  exit 1
fi

wget https://github.com/tcnksm/ghr/releases/download/v0.12.0/ghr_v0.12.0_linux_amd64.tar.gz
tar xvfz ghr_v0.12.0_linux_amd64.tar.gz

./ghr_v0.12.0_linux_amd64/ghr -u $CIRCLE_PROJECT_USERNAME -delete $1 ./artifacts
