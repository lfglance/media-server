#!/bin/bash

# Setup ownership of the /media and /srv/radarr dirs
chown -R radarr:radarr /srv/radarr

# Run radarr
sudo -u radarr /srv/radarr/Radarr -nobrowser -data=/srv/radarr/data