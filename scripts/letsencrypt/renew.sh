#!/bin/bash

# Stop nginx during renewal
docker stop sseeos_gateway_1;

# Renew the certs
if /opt/letsencrypt/letsencrypt-auto renew -nvv --standalone > /var/log/letsencrypt/renew.log 2>&1 ; then
	# copy them to a place where nginx knows whats happening
	cp /etc/letsencrypt/live/ssedev.se.rit.edu/cert.pem /etc/ssl/sse.rit.edu/server.crt
	cp /etc/letsencrypt/live/ssedev.se.rit.edu/privkey.pem /etc/ssl/sse.rit.edu/server.key
fi

docker start sseeos_gateway_1;
