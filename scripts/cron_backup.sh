#!/bin/bash
# docker rm backup_ambassador;
# docker run -d -p 5432:5432 --link docker_postgres_1 --name backup_ambassador svendowideit/ambassador;
NAME=docker_postgres_1
docker exec $NAME pg_dump --username "sse" --no-password  --format tar --blobs --section pre-data --section data --section post-data --verbose --file "/tmp/sse_backup.tar" "sse"
docker cp $NAME:/tmp/sse_backup.tar ./
scp ./sse_backup.tar sseprod.se.rit.edu:/root/backups/
docker exec $NAME rm /tmp/sse_backup.tar
rm ./sse_backup.tar
