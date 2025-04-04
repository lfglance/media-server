#!/bin/bash

# Setup ownership of the /srv/lidarr dir
chown -R lidarr:lidarr /srv/lidarr

# Run lidarr
sudo -u lidarr /srv/lidarr/Lidarr -nobrowser -data=/srv/lidarr/data/