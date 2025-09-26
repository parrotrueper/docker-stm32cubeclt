FROM ubuntu:noble-20250910

# downloaded filename without the ".zip"
ARG ST_INSALLER="st-stm32cubeclt_1.19.0_25876_20250729_1159_amd64.deb_bundle.sh"

COPY docker-data/ /

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    #&& apt-get install -y --no-install-recommends \
    && ./installer.sh ${ST_INSALLER}

SHELL ["/usr/bin/bash", "-c"]
RUN source /etc/bash.bashrc




