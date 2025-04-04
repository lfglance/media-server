#!/bin/bash

export TZ=UTC

# Setup ownership of the /media and /srv/homepage dirs
chown -R homepage:homepage /srv/homepage

# Run homepage
sudo -u homepage bash
npm run start