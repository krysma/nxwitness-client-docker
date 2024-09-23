#!/usr/bin/env bash
set -e

source ./version.sh

NX_IMAGE="ghcr.io/krysma/nxwitness-client:${VERSION}.${BUILD_NO}"

NX_INI_PATH="${HOME}/.config/nx_ini"
NX_SETTINGS_PATH="${HOME}/.local/share/Network Optix"
NX_CONFIG_PATH="${HOME}/.config/Network Optix"
NX_CACHE_PATH="${HOME}/.cache/Network Optix"
NX_SHARED_PATH="${HOME}/nxwitness_shared"

mkdir -p ${NX_INI_PATH}
mkdir -p ${NX_SETTINGS_PATH}
mkdir -p ${NX_CONFIG_PATH}
mkdir -p ${NX_CACHE_PATH}
mkdir -p ${NX_SHARED_PATH}

docker run --rm -e DISPLAY --privileged \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v "${NX_INI_PATH}:/root/.config/nx_ini" \
    -v "${NX_SETTINGS_PATH}:/root/.local/share/Network Optix" \
    -v "${NX_CONFIG_PATH}:/root/.config/Network Optix" \
    -v "${NX_CACHE_PATH}:/root/.cache/Network Optix" \
    -v "${NX_SHARED_PATH}:/root/nxwitness_shared" \
    ${NX_IMAGE}
