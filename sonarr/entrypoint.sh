#!/bin/bash

# Setup ownership of the /srv/sonarr dir
chown -R sonarr:sonarr /srv/sonarr

# Run sonarr
sudo -u sonarr /srv/sonarr/Sonarr