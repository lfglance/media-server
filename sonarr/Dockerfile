FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive

# Installation dependencies
RUN apt update
RUN apt install wget sudo libicu-dev sqlite3 -y

# Install sonarr
RUN wget -q "https://github.com/Sonarr/Sonarr/releases/download/v4.0.14.2939/Sonarr.main.4.0.14.2939.linux-x64.tar.gz" -O sonarr.tar.gz
RUN tar xzf sonarr.tar.gz
RUN rm sonarr.tar.gz
RUN mv Sonarr /srv/sonarr
RUN adduser \
   --system \
   --shell /bin/bash \
   --gecos 'sonarr daemon' \
   --group \
   --disabled-password \
   --home /srv/sonarr \
   --uid 1000 \
   sonarr
RUN chown -R sonarr:sonarr /srv/sonarr

# Setup entrypoint
WORKDIR /srv/sonarr
ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

# Run
CMD ["/entrypoint.sh"]
