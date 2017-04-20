#!/bin/bash

# Docker networks
docker network create -d overlay external

# You should make sure the following labels exists on the right nodes
# db=true
# docker node update --label-add db=true moby
