#!/usr/bin/env bash
set -e

# Create configs if they do not exist
touch /root/.config/nx_ini/nx_network.ini
touch /root/.config/nx_ini/nx_utils.ini
touch /root/.config/nx_ini/nx_build_info.ini
touch /root/.config/nx_ini/nx_media.ini
touch /root/.config/nx_ini/nx_build_info.ini
touch /root/.config/nx_ini/desktop_client.ini
touch /root/.config/nx_ini/nx_vms_client_core.ini
touch /root/.config/nx_ini/nx_system_updates.ini
touch /root/.config/nx_ini/resource_management.ini
touch /root/.config/nx_ini/analytics_logging.ini
touch /root/.config/nx_ini/nx_streaming.ini

nxwitness_client --no-sandbox
