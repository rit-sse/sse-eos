#!/bin/bash

DOCKER_ID=`docker ps | grep db_postgres | awk '{print $1}'`
docker exec -it $DOCKER_ID /usr/bin/pg_dump -U postgres postgres > dump.sql
