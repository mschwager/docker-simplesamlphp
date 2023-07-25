#!/bin/sh

set -e

SIMPLESAMLPHP_VERSION="2.0.4"
SIMPLESAMLPHP_CHECKSUM="10f50ae5165b044cd4c78de3c118a025ecf47586e428f16b340933f9d44ab52c"

wget -q https://github.com/simplesamlphp/simplesamlphp/releases/download/v$SIMPLESAMLPHP_VERSION/simplesamlphp-$SIMPLESAMLPHP_VERSION.tar.gz
echo "$SIMPLESAMLPHP_CHECKSUM  simplesamlphp-$SIMPLESAMLPHP_VERSION.tar.gz" | sha256sum -c -
tar -xzf simplesamlphp-$SIMPLESAMLPHP_VERSION.tar.gz

mkdir -p .storage/

cp -R simplesamlphp-$SIMPLESAMLPHP_VERSION/config .storage/
cp -R simplesamlphp-$SIMPLESAMLPHP_VERSION/metadata .storage/
cp -R simplesamlphp-$SIMPLESAMLPHP_VERSION/cert .storage/
