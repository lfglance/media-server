FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive

# Installation dependencies
RUN apt update -y
RUN apt install wget sudo curl mediainfo sqlite3 libchromaprint-tools -y

# Install lidarr
RUN wget -q "https://github.com/Lidarr/Lidarr/releases/download/v2.10.3.4602/Lidarr.master.2.10.3.4602.linux-core-x64.tar.gz" -O lidarr.tar.gz
RUN tar xzf lidarr.tar.gz
RUN rm lidarr.tar.gz
RUN mv Lidarr/ /srv/lidarr
RUN adduser \
   --system \
   --shell /bin/bash \
   --gecos 'lidarr daemon' \
   --group \
   --disabled-password \
   --home /srv/lidarr \
   --uid 1000 \
   lidarr
RUN chown -R lidarr:lidarr /srv/lidarr

# Setup entrypoint
WORKDIR /srv/radarr
ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

# Run
CMD ["/entrypoint.sh"]
