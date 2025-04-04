FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive

# Installation dependencies
RUN apt update
RUN apt install wget sudo libicu-dev sqlite3 -y

# Install radarr
RUN wget -q "https://github.com/Radarr/Radarr/releases/download/v5.21.1.9799/Radarr.master.5.21.1.9799.linux-core-x64.tar.gz" -O radarr.tar.gz
RUN tar xzf radarr.tar.gz
RUN rm radarr.tar.gz
RUN mv Radarr /srv/radarr
RUN adduser \
   --system \
   --shell /bin/bash \
   --gecos 'radarr daemon' \
   --group \
   --disabled-password \
   --home /srv/radarr \
   --uid 1000 \
   radarr
RUN chown -R radarr:radarr /srv/radarr

# Setup entrypoint
WORKDIR /srv/radarr
ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

# Run
CMD ["/entrypoint.sh"]
