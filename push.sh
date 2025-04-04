#!/bin/bash

# push repo to media server

rsync -avzP -e ssh ./ media:media/ \
    --exclude=data/ \
    --exclude=.git