#!/bin/bash

# Setup ownership of the /media and /srv/sabnzbd dirs
chown -R sabnzbd:sabnzbd /media /srv/sabnzbd

# Run sabnzbd
sudo -u sabnzbd /srv/sabnzbd/.venv/bin/python3 /srv/sabnzbd/SABnzbd.py \
    -s 0.0.0.0:8080