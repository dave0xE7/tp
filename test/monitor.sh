#!/bin/bash

while [ true ]; do

clear

#ps aux | grep sshd

echo ""
systemctl status sshd plug

#echo ""
#systemctl status autossh

sleep 1

done