#!/bin/sh

set -e

SIMPLESAMLPHP_VERSION="1.15.2"
SIMPLESAMLPHP_CHECKSUM="c0227e3ad0a1beb2ccca9147d1bd0338a0dfbd4166c06dc063f1f7ce1067bf20"

wget -q https://github.com/simplesamlphp/simplesamlphp/releases/download/v$SIMPLESAMLPHP_VERSION/simplesamlphp-$SIMPLESAMLPHP_VERSION.tar.gz
echo "$SIMPLESAMLPHP_CHECKSUM  simplesamlphp-$SIMPLESAMLPHP_VERSION.tar.gz" | sha256sum -c -
tar -xzf simplesamlphp-$SIMPLESAMLPHP_VERSION.tar.gz

mkdir -p .storage/

cp -R simplesamlphp-$SIMPLESAMLPHP_VERSION/config/ .storage/
cp -R simplesamlphp-$SIMPLESAMLPHP_VERSION/metadata/ .storage/
cp -R simplesamlphp-$SIMPLESAMLPHP_VERSION/cert/ .storage/
