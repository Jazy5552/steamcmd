FROM debian:buster-slim
MAINTAINER Jazy <jazy@jazyserver.com>

RUN set -x \
  && apt-get update \
  && apt-get install -y --no-install-recommends --no-install-suggests \
    lib32stdc++6 lib32gcc1 wget ca-certificates bash \
  && mkdir -p /steamcmd \
  && cd /steamcmd \
  && wget -qO - 'https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz' | tar zxf - \
  && apt-get clean autoclean \
  && apt-get autoremove -y \
  && rm -rf /var/lib/apt/lists/*

VOLUME /steamcmd

