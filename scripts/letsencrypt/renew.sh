#!/bin/bash

# Renew the certs
/opt/letsencrypt/letsencrypt-auto renew

# copy them to a place where nginx knows whats happening
cp /etc/letsencrypt/live/ssedev.se.rit.edu/cert.pem /etc/ssl/sse.rit.edu/server.crt
cp /etc/letsencrypt/live/ssedev.se.rit.edu/privkey.pem /etc/ssl/sse.rit.edu/server.key

# may need to restart nginx, but most likely not.
docker restart sseeos_gateway_1

