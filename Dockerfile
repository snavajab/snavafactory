# setup
FROM ubuntu:latest
LABEL maintainer="Tommaso Morganti <tommaso.morganti01@gmail.com>"
EXPOSE 34197/udp

RUN apt-get update -y
RUN apt-get install -y wget xz-utils

# install factorio
RUN wget -O /tmp/factorio.tar.xz https://www.factorio.com/get-download/latest/headless/linux64
RUN tar -xvf /tmp/factorio.tar.xz -C /opt/
RUN rm /tmp/factorio.tar.xz

COPY server-settings.json /opt/factorio/data/server-settings.json

# startup
WORKDIR /opt/factorio
ENTRYPOINT ["/opt/factorio/bin/x64/factorio", "--start-server", "/opt/factorio/saves/save.zip", "--server-settings", "/opt/factorio/data/server-settings.json"]