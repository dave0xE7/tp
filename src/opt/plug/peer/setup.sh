#!/bin/bash

TARGET=/opt/plug

alias mkdir='mkdir -v'
alias rmdir='rmdir -v'
alias chown='chown -v'
alias cp='cp -v'

systemctl enable sshd
systemctl start sshd


if [ ! -d $TARGET/peer ]; then
    sudo mkdir $TARGET/peer
    sudo mkdir $TARGET/peer/hosts
    sudo chown -R peer.peer $TARGET/peer
fi

if [ ! -f $TARGET/peer/peer.sh ]; then
    sudo cp peer.sh $TARGET/peer/peer.sh
fi
sudo cp peer.sh $TARGET/peer/peer.sh

if [ ! -d $TARGET/peer/.ssh ]; then
    sudo mkdir $TARGET/peer/.ssh
    sudo cat $TARGET/autossh/shared_rsa.pub >> $TARGET/peer/.ssh/authorized_keys
    sudo chown -R peer.peer $TARGET/peer/.ssh
fi

if [ ! -f $TARGET/peer/id_rsa ]; then
    sudo -u peer ssh-keygen -f /opt/plug/peer/id_rsa -t rsa -N ''
fi


if [ ! -f $TARGET/peer/.ssh/authorized_keys ]; then
    sudo cat ../../assets/shared_rsa.pub >> $TARGET/peer/.ssh/authorized_keys
fi

sudo useradd -r -s /bin/false -d /opt/plug/peer peer

File=/etc/ssh/sshd_config
if ! grep -Fxq "Match User peer" "$File"
    then
            echo "Match User peer" >> /etc/ssh/sshd_config
            echo "        ForceCommand /opt/plug/peer/peer.sh" >> /etc/ssh/sshd_config
            echo "        PermitTTY no" >> /etc/ssh/sshd_config
            echo "        PasswordAuthentication no" >> /etc/ssh/sshd_config
fi
