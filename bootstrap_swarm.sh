#!/bin/bash

echo "I'm assuming you set the db label on the host you want...";

# Docker networks
docker network create -d overlay external
docker network create -d overlay internal

# You should make sure the following labels exists on the right nodes
# db=true
# docker node update --label-add db=true moby

cd loadbalancer && ./deploy
cd ..
cd sseprod.se.rit.edu && HOST=sseprod.se.rit.edu ./deploy
cd ..
cd sseold && HOST=sseprod.se.rit.edu ./deploy
cd ..
cd allendoesphysics.com && HOST=allendoesphysics.com ./deploy
cd ..
cd database && ./deploy
cd ..
cd planyourcourses.com && HOST=planyourcourses.com ./deploy
cd ..
