#!/bin/bash

JELLYFINDIR=/srv/jellyfin

# Setup ownership of the /media and /srv/jellyfin/config dirs
chown -R jellyfin:jellyfin /media $JELLYFINDIR

# Run jellyfin
sudo -u jellyfin /usr/bin/jellyfin \
 --datadir $JELLYFINDIR/data \
 --cachedir $JELLYFINDIR/cache \
 --configdir $JELLYFINDIR/config \
 --logdir $JELLYFINDIR/log \
 --ffmpeg /usr/lib/jellyfin-ffmpeg/ffmpeg \
 --webdir /usr/share/jellyfin/web/