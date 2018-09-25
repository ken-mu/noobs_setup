#!/bin/sh

if [ $# -ne 1 ]; then
  echo argument error
  exit 1
fi

ghr -u $CIRCLE_PROJECT_USERNAME -delete $1 ./artifacts
