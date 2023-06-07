#!/bin/bash
source $PWD/.env
cd $FILELOCATION
bash $FILELOCATION/stop.sh
docker compose up -d --force-recreate
