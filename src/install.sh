#!/bin/bash

source config

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

alias checkdir=''

if [ ! -d $TARGET ]; then
    sudo mkdir -v $TARGET
fi

chown -R root.root $TARGET
chmod -R 0750 $TARGET

cp -v -r $CWD/src/opt/plug/* $TARGET/.

# basic installation is done
# 
# systemd service

if [ -d /etc/systemd ]; then
    cp -v $CWD/src/etc/systemd/system/plug.service /etc/systemd/system/plug.service
    systemctl daemon-reload
    systemctl enable plug
    systemctl restart plug
fi
