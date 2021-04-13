#!/bin/bash

source config

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

systemctl stop plug
systemctl disable plug

rm -v -rf $TARGET