#!/bin/bash
NAME=postgres
docker exec $NAME pg_dump --username "sse" --no-password  --format tar --blobs --section pre-data --section data --section post-data --verbose --file "/tmp/sse_backup.tar" "sse"
docker cp $NAME:/tmp/sse_backup.tar /home/deploy/backups/
scp /home/deploy/backups/sse_backup.tar deploy@ssedev.se.rit.edu:/home/deploy/backups/
docker exec $NAME rm /tmp/sse_backup.tar

