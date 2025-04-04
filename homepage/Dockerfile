FROM ubuntu:22.04

ENV VERSION 0.6.16
ENV NODE_VERSION v18.16.0
ENV DEBIAN_FRONTEND noninteractive

# Installation dependencies
RUN apt update
RUN apt install git sudo wget xz-utils -y

# Install nodejs
WORKDIR /tmp/homepage
RUN wget -q https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64.tar.xz -O nodejs.tar.xz
RUN tar xf nodejs.tar.xz
RUN mv node-${NODE_VERSION}-linux-x64/lib/* /usr/local/lib/
RUN mv node-${NODE_VERSION}-linux-x64/bin/* /usr/local/bin/

# Install homepage
RUN wget -q https://github.com/benphelps/homepage/archive/refs/tags/v${VERSION}.tar.gz
RUN tar xzf v${VERSION}.tar.gz
RUN mv homepage-${VERSION} /srv/homepage
RUN adduser \
   --system \
   --shell /bin/bash \
   --gecos 'homepage daemon' \
   --group \
   --disabled-password \
   --home /srv/homepage \
   --uid 1000 \
   homepage
RUN chown -R homepage:homepage /srv/homepage
WORKDIR /srv/homepage
USER homepage
RUN mkdir config
RUN npm install
RUN npm run build

# Cleanup
USER root
RUN rm -rf /tmp/homepage /srv/homepage/config

# Setup entrypoint
ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

# Run
CMD ["/entrypoint.sh"]




