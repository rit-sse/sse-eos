#!/bin/bash
NAME=postgres
docker cp /home/deploy/backups/sse_backup.tar $NAME:/tmp/
docker exec $NAME pg_restore --username "sse" --dbname "sse" --no-password  --section pre-data --section data --section post-data --clean --verbose "/tmp/sse_backup.tar"
/home/deploy/sse-eos/scripts/update_dev_officers.sh
