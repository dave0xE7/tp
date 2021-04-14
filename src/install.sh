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
    #cp -v $CWD/src/etc/systemd/system/plug.service /etc/systemd/system/plug.service
    echo "[Unit]
Description=TPservice
#Documentation=man:sshd(8) man:sshd_config(5)
#After=network.target auditd.service
#ConditionPathExists=!/etc/ssh/sshd_not_to_be_run

[Service]
User=root
#EnvironmentFile=-/etc/default/ssh
#ExecStartPre=/usr/sbin/sshd -t
ExecStart=/opt/plug/main.sh
#ExecReload=/usr/sbin/sshd -t
#ExecReload=/bin/kill -HUP $MAINPID
#KillMode=process
#Restart=on-failure
#RestartPreventExitStatus=255
#Type=notify
#RuntimeDirectory=sshd
#RuntimeDirectoryMode=0755

[Install]
WantedBy=multi-user.target
#Alias=sshd.service" > /etc/systemd/system/plug.service

    systemctl daemon-reload
    systemctl enable plug
    systemctl restart plug
fi
