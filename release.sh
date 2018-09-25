#!/bin/sh

if [ $# -ne 1 ]; then
  echo argument error
  exit 1
fi

ghr $1 ./artifacts -delete
