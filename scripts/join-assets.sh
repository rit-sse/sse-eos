#!/bin/bash

./scripts/bootstrap-dev.sh run npm i || 0
./scripts/bootstrap-dev.sh run npm run build || 0
