#!/bin/bash

# Setup ownership of the /media and /srv/bazarr dirs
chown -R bazarr:bazarr /srv/bazarr/data

# Run bazarr
sudo -u bazarr python3 /srv/bazarr/bazarr.py