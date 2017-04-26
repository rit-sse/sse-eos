#!/bin/bash

# Docker networks
docker network create -d overlay external
docker network create -d overlay internal

# You should make sure the following labels exists on the right nodes
# db=true
# docker node update --label-add db=true moby
