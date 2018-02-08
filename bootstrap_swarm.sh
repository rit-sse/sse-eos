#!/bin/bash

echo "Bootstrapping Swarm!";

echo "Setting Up Networks...";
# Docker Networks
docker network create -d overlay external
docker network create -d overlay internal

echo "Setting Up Loadbalancer...";

cd loadbalancer && ./deploy
cd ..

echo "Setting Up sse.rit.edu...";

cd sse.rit.edu && ./deploy
cd ..

echo "Setting Up ssedev.se.rit.edu..."

cd ssedev.se.rit.edu && ./deploy
cd ..

echo "Setting Up allendoesphysics.com..."

cd allendoesphysics.com && ./deploy
cd ..

echo "Setting Up planyourcourses.com..."

cd planyourcourses.com && ./deploy
cd ..

echo "All Done! 🚀"
