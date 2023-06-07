#!/bin/bash
source $PWD/.env
docker stop $CONTAINERNAME
docker rm -f $CONTAINERNAME