#!/bin/sh

set -eu

VERSION=2_8_2

# remove artifact if exist
if [ -e build ]; then
  rm -r build
fi
if [ -e artifacts ]; then
  rm -r artifacts
fi
mkdir -p build/NOOBS_v${VERSION} artifacts

# download NOOBS
wget http://downloads.raspberrypi.org/NOOBS/images/NOOBS-2018-06-29/NOOBS_v${VERSION}.zip

# checksum
wget http://downloads.raspberrypi.org/NOOBS/images/NOOBS-2018-06-29/NOOBS_v${VERSION}.zip.sha256
sha256sum -c NOOBS_v${VERSION}.zip.sha256

# unzip
unzip NOOBS_v${VERSION}.zip -d build/NOOBS_v${VERSION}

# append "silentinstall"
cd build/NOOBS_v${VERSION}
sed -i 's|$| silentinstall|' recovery.cmdline

# Remove other OS
cd os
ls|egrep -v '^Raspbian$'|xargs rm -r

# enable SSH
sed -i -e '/^umount \/tmp\/1/i\touch /tmp/1/ssh' Raspbian/partition_setup.sh

# zip artifacts
cd ../
zip -r ../../artifacts/NOOBS_SETUP_v${VERSION}.zip .
cd ../../
