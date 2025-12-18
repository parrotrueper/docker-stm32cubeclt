FROM debian:trixie-slim

# downloaded filename without the ".zip"
ARG ST_INSALLER="st-stm32cubeclt_1.20.0_26822_20251117_1245_amd64.deb_bundle.sh"

COPY docker-data/ /

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && ./installer.sh ${ST_INSALLER} \
    && rm ./installer.sh

SHELL ["/usr/bin/bash", "-c"]
RUN source /etc/bash.bashrc




