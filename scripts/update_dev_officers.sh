#!/bin/bash

ACCOUNTS=("mpt2360" "jwc6999" "wam9729");

rm /tmp/insert.sql;

for name in "${ACCOUNTS[@]}";
do
	echo "Added user $name to insert script";
	sed -e "s/mpt2360/$name/g" ./scripts/add_dev_person.sql >> /tmp/insert.sql;
done;

docker cp /tmp/insert.sql postgres:/tmp/script.sql;
docker exec postgres psql -U postgres -f /tmp/script.sql sse;

