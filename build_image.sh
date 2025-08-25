#!/usr/bin/env bash
set -e

source ./version.sh

docker build --build-arg NXWITNESS_VERSION="${VERSION}" --build-arg NXWITNESS_BUILD="${BUILD_NO}" -t nxwitness/client:${VERSION}.${BUILD_NO} .
