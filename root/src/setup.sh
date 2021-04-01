#!/bin/bash

TARGET=/opt/plug

if [ ! -d $TARGET ]; then
    sudo mkdir $TARGET
fi

pkgs="curl wget nodejs"

function AptInstall {
    if ! dpkg -s $pkgs >/dev/null 2>&1; then
    sudo apt-get install $pkgs -y
    fi
}

if [ -x "$(command -v apk)" ];       then sudo apk add --no-cache $pkgs
elif [ -x "$(command -v apt-get)" ]; then sudo apt-get install $pkgs openssh-client openssh-server autossh
# - elif [ -x "$(command -v apt-get)" ]; then sudo apt-get install $pkgs a
elif [ -x "$(command -v pacman)" ];     then sudo pacman -Sy --noconfirm $pkgs openssh nodejs autossh
elif [ -x "$(command -v zypper)" ];  then sudo zypper install $pkgs
else echo "FAILED TO INSTALL PACKAGE: Package manager not found. You must manually install: $pkgs">&2; fi

sudo systemctl restart ssh

if [ -f /etc/systemd/system/ssh.service ]; then
    sudo systemctl enable ssh
fi;

if [ ! -d $TARGET ]; then
    sudo mkdir $TARGET
fi

if [ ! -d $TARGET/autossh ]; then
    sudo mkdir $TARGET/autossh
    sudo chown autossh.autossh $TARGET/autossh
fi

sudo useradd -r -s /bin/false -d /opt/plug/autossh autossh

sudo cp ssh_config $TARGET/autossh/ssh_config

sudo cp shared_rsa $TARGET/autossh/shared_rsa
sudo cp shared_rsa.pub $TARGET/autossh/shared_rsa.pub

if [ ! -f $TARGET/autossh/id_rsa ]; then
    sudo -u autossh ssh-keygen -f /opt/plug/autossh/id_rsa -t rsa -N ''
fi

sudo chown -R autossh.autossh $TARGET/autossh
sudo chmod -R 600 $TARGET/autossh

sudo cp main.sh $TARGET/.

sudo cp systemd/*.service /etc/systemd/system/.

if [ ! -f /opt/plug/hostid ]; then

    hostid=$(sha256sum /etc/ssh/ssh_host_rsa_key.pub | awk '{print $1}')
    echo $hostid
    echo $hostid | sudo tee /opt/plug/hostid

fi


sudo systemctl daemon-reload
sudo systemctl restart plug
sudo systemctl status plug

sudo systemctl enable autossh@5000
sudo systemctl start autossh@5000
sudo systemctl status autossh@5000
