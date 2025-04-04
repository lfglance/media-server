FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive

# Installation dependencies
RUN apt update
RUN apt install sudo wget -y

# Jellyfin installation
WORKDIR /tmp/jellyfin
RUN wget -q https://repo.jellyfin.org/files/server/ubuntu/latest-stable/amd64/jellyfin-server_10.10.6+ubu2004_amd64.deb -O jellyfin-server.deb
RUN wget -q https://repo.jellyfin.org/files/server/ubuntu/latest-stable/amd64/jellyfin-web_10.10.6+ubu2204_all.deb -O jellyfin-web.deb
RUN wget -q https://repo.jellyfin.org/files/ffmpeg/ubuntu/latest-7.x/amd64/jellyfin-ffmpeg7_7.0.2-9-jammy_amd64.deb -O jellyfin-ffmpeg.deb
RUN apt install ./jellyfin-server.deb ./jellyfin-web.deb ./jellyfin-ffmpeg.deb -y

# Jellyfin run script
WORKDIR /srv/jellyfin
RUN rm -rf /tmp/jellyfin
ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

# Run
CMD [ "/entrypoint.sh" ]