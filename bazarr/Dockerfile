FROM ubuntu:22.04

ENV VERSION v1.5.2-beta.32
ENV DEBIAN_FRONTEND noninteractive

# Installation dependencies
RUN apt update
RUN apt install wget sudo 7zip python3-dev python3-pip python3-distutils unrar unzip -y

# bazarr installation
RUN wget -q https://github.com/morpheus65535/bazarr/releases/download/${VERSION}/bazarr.zip \
    && unzip bazarr.zip -d /srv/bazarr \
    && rm bazarr.zip
WORKDIR /srv/bazarr
RUN adduser \
   --system \
   --shell /bin/bash \
   --gecos 'bazarr' \
   --group \
   --disabled-password \
   --home /srv/bazarr \
   --uid 1000 \
   bazarr
RUN python3 -m pip install -r requirements.txt
RUN chown -R bazarr:bazarr /srv/bazarr

# Need root to mount volumes and set perms
ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

# Run
CMD ["/entrypoint.sh"]