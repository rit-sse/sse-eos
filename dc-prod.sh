#!/bin/bash
docker-compose -f docker-compose.devlop.yml -f docker-compose.override.yml $@
