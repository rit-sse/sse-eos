#!/bin/bash

mkdir -p /etc/ssl/sse.rit.edu/

openssl req \
  -new \
  -newkey rsa:2048 \
  -sha1 \
  -days 3650 \
  -nodes \
  -x509 \
  -keyout /etc/ssl/sse.rit.edu/server.key \
  -out /etc/ssl/sse.rit.edu/server.crt \
  -config /tmp/openssl/openssl.conf
