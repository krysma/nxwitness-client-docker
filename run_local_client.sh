#!/usr/bin/env bash
set -e

NX_IMAGE="nxwitness/client:5.1.0.37133"

NX_INI_PATH="${HOME}/.config/nx_ini"
NX_SETTINGS_PATH="${HOME}/.local/share/Network Optix"
NX_CONFIG_PATH="${HOME}/.config/Network Optix"
NX_CACHE_PATH="${HOME}/.cache/Network Optix"

mkdir -p ${NX_INI_PATH}
mkdir -p ${NX_SETTINGS_PATH}
mkdir -p ${NX_CONFIG_PATH}
mkdir -p ${NX_CACHE_PATH}

docker run --rm -e DISPLAY --privileged \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v "${NX_INI_PATH}:/root/.config/nx_ini" \
    -v "${NX_SETTINGS_PATH}:/root/.local/share/Network Optix" \
    -v "${NX_CONFIG_PATH}:/root/.config/Network Optix" \
    -v "${NX_CACHE_PATH}:/root/.cache/Network Optix" \
    ${NX_IMAGE}
