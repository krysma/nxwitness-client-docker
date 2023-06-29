FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y wget libgtk2.0-0 libgtk-3-0 pulseaudio xauth qt5-default libmfx1 libmfx-tools libva-drm2 libva-x11-2 vainfo intel-media-va-driver-non-free

RUN wget -q -O /tmp/nxwitness.deb https://updates.networkoptix.com/default/36634/linux/nxwitness-client-5.0.0.36634-linux_x64.deb \
  && apt-get update \
  && apt install -y /tmp/nxwitness.deb \
  && rm /tmp/nxwitness.deb \
  && mkdir -p /root/.config/nx_ini \
  && mkdir -p "/root/.local/share/Network Optix" \
  && mkdir -p "/root/.config/Network Optix" \
  && mkdir -p "/root/.cache/Network Optix"

RUN ln -s /opt/networkoptix/client/5.0.0.36634/bin/nxwitness_client /bin/nxwitness_client
ADD resources/run_nx_client.sh /bin/run_nx_client
RUN chmod +x /bin/run_nx_client

ENTRYPOINT [ "run_nx_client" ]
