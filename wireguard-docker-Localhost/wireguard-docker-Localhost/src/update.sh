#!/bin/bash
source $PWD/.env
cd $FILELOCATION
docker compose pull
bash $FILELOCATION/run.sh