#!/bin/bash
echo "update repo please wait a few minutes "
apt-get update 
clear
echo "install wireguard tools please wait a few minutes "
apt-get install -y wireguard-dkms wireguard-tools 
modprobe wireguard
clear
echo "install wg docker"
source $PWD/.env
mkdir -p $FILELOCATION
cp -r ./src/* $FILELOCATION
cp -r ./.env $FILELOCATION
bash $FILELOCATION/run.sh
echo "your docker wg install at $FILELOCATION"