#!/bin/bash

docker cp ./add_dev_person.sql postgres:/tmp/script.sql;
docker exec postgres psql -U postgres -f /tmp/script.sql sse;

