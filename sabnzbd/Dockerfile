FROM ubuntu:22.04

ENV VERSION 4.5.0
ENV DEBIAN_FRONTEND noninteractive

# Installation dependencies
RUN apt update
RUN apt install wget python3-venv unrar par2 p7zip-full sudo -y

# SABnzbd installation
RUN wget -q https://github.com/sabnzbd/sabnzbd/releases/download/${VERSION}/SABnzbd-${VERSION}-src.tar.gz
RUN tar xzvf SABnzbd-${VERSION}-src.tar.gz
RUN rm SABnzbd-${VERSION}-src.tar.gz
RUN mv SABnzbd-${VERSION} /srv/sabnzbd && mkdir -p /media
RUN adduser \
   --system \
   --shell /bin/bash \
   --gecos 'SABnzbd daemon' \
   --group \
   --disabled-password \
   --home /srv/sabnzbd \
   --uid 1000 \
   sabnzbd
RUN chown -R sabnzbd:sabnzbd /srv/sabnzbd /media
WORKDIR /srv/sabnzbd
USER sabnzbd
RUN python3 -m venv .venv
RUN ./.venv/bin/pip install -r requirements.txt

# Need root to mount volumes and set perms
USER root
ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

# Run
CMD ["/entrypoint.sh"]