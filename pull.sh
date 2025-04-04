#!/bin/bash

# pull repo from media server

rsync -avzP -e ssh media:media/data/ ./data/ \
    --exclude=media \
    --exclude=.git \
    --exclude=jellyfin/cache \
    --exclude=jellyfin/data/metadata \
    --exclude=radarr/MediaCover \
    --exclude=sonarr/MediaCover