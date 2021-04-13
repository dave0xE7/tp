#!/bin/bash

TARGET=/opt/plug

pkgs="curl wget nodejs"

function AptInstall {
    if ! dpkg -s $pkgs >/dev/null 2>&1; then
    apt-get install $pkgs -y
    fi
}

if [ -x "$(command -v apk)" ];       then apk add --no-cache $pkgs
elif [ -x "$(command -v apt-get)" ]; then apt-get install $pkgs openssh-client openssh-server autossh
# - elif [ -x "$(command -v apt-get)" ]; then apt-get install $pkgs a
elif [ -x "$(command -v pacman)" ]; then 
    pacman -Sy --noconfirm $pkgs openssh nodejs autossh 2>&1 /dev/null
elif [ -x "$(command -v zypper)" ];  then zypper install $pkgs
else echo "FAILED TO INSTALL PACKAGE: Package manager not found. You must manually install: $pkgs">&2; fi


# enableing ssh server
#systemctl restart sshd
#
if [ -f /etc/systemd/system/sshd.service ]; then
    systemctl enable sshd
    systemctl restart sshd
fi

useradd -r -M -d /opt/plug/ plug

chown -R plug.plug $TARGET
chmod 0700 $TARGET/ssh
chmod 0600 $TARGET/ssh/authorized_keys

if [ ! -f $TARGET/ssh/id_rsa ]; then
    #-u plug ssh-keygen -f /opt/plug/ssh/id_rsa -t rsa -N ''
    ssh-keygen -f /opt/plug/ssh/id_rsa -t rsa -N ''
fi

if [ ! -f /opt/plug/hostid ]; then
    #hostid=$(sha256sum /etc/ssh/ssh_host_rsa_key.pub | awk '{print $1}')
    hostid=$(md5sum /opt/plug/ssh/id_rsa.pub | awk '{print $1}')
    echo $hostid
    echo $hostid | tee /opt/plug/hostid
fi

ln -s $TARGET/ssh $TARGET/.ssh