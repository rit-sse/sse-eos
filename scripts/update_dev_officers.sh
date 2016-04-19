#!/bin/bash

ACCOUNTS="mpt2360
jwd6999
tbm2961";

rm /tmp/insert.sql;

for name in $ACCOUNTS;
do
	sed "s/mpt2360/$name/g" ./scripts/add_dev_person.sql >> /tmp/insert.sql;
done;

docker cp /tmp/insert.sql postgres:/tmp/script.sql;
docker exec postgres psql -U postgres -f /tmp/script.sql sse;

