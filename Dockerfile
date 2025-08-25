FROM ubuntu:22.04
ARG DEBIAN_FRONTEND=noninteractive

ARG NXWITNESS_VERSION=5.1.4
ARG NXWITNESS_BUILD=38659
ENV NXWITNESS_VERSION=${NXWITNESS_VERSION}
ENV NXWITNESS_BUILD=${NXWITNESS_BUILD}

RUN apt-get update && apt-get install -y software-properties-common && add-apt-repository -y ppa:ubuntu-toolchain-r/test && apt-get update && apt-get install -y --only-upgrade libstdc++6 && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y wget libgtk2.0-0 libgtk-3-0 pulseaudio xauth qtbase5-dev qt5-qmake libmfx1 libmfx-tools libva-drm2 libva-x11-2 vainfo intel-media-va-driver-non-free libatomic1 && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN wget -q -O /tmp/nxwitness.deb https://updates.networkoptix.com/default/${NXWITNESS_BUILD}/linux/nxwitness-client-${NXWITNESS_VERSION}.${NXWITNESS_BUILD}-linux_x64.deb \
  && apt-get update \
  && apt install -y /tmp/nxwitness.deb \
  && rm /tmp/nxwitness.deb \
  && mkdir -p /root/.config/nx_ini \
  && mkdir -p "/root/.local/share/Network Optix" \
  && mkdir -p "/root/.config/Network Optix" \
  && mkdir -p "/root/.cache/Network Optix"

RUN ln -s /opt/networkoptix/client/${NXWITNESS_VERSION}.${NXWITNESS_BUILD}/bin/nxwitness_client /bin/nxwitness_client
ADD resources/run_nx_client.sh /bin/run_nx_client
RUN chmod +x /bin/run_nx_client

ENTRYPOINT [ "run_nx_client" ]
