#!/bin/bash

# IMPORTANT
# You should make sure the following labels exists on the right nodes
# db=true
# docker node update --label-add db=true moby
echo "I'm assuming you set the db label on the host you want...";

# Docker networks
docker network create -d overlay external
docker network create -d overlay internal

# This file is only for bringing up the base site

cd loadbalancer && ./deploy
cd ..
cd database && ./deploy
cd ..
cd sse.rit.edu && HOST=sse.rit.edu ./deploy
