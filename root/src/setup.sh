#!/bin/bash

targetPath=/opt/plug

pkgs="openssh-client openssh-server curl wget nodejs"

if ! dpkg -s $pkgs >/dev/null 2>&1; then
  sudo apt-get install $pkgs -y
fi

sudo systemctl restart ssh

if [ -f /etc/systemd/system/ssh.service ]; then
    sudo systemctl enable ssh
fi;

if [ ! -d $targetPath ]; then
    sudo mkdir $targetPath
fi

if [ ! -d $targetPath/autossh ]; then
    sudo mkdir $targetPath/autossh
fi

useradd -r -s /bin/false -d /opt/plug/autossh autossh

sudo cp ssh_config $targetPath/autossh/ssh_config

if [ ! -f $targetPath/autossh/id_rsa ]; then
    sudo ssh-keygen -f /opt/plug/autossh/id_rsa -t rsa -N ''
fi

sudo cp main.sh $targetPath/.

sudo cp systemd/*.service /etc/systemd/system/.

if [ ! -f /opt/plug/hostid ]; then

    hostid=$(sha256sum /etc/ssh/ssh_host_rsa_key.pub | awk '{print $1}')
    echo $hostid
    echo $hostid | sudo tee /opt/plug/hostid

fi

chown -R autossh.autossh $targetPath/autossh
chmod -R 600 $targetPath/autossh

sudo systemctl daemon-reload
sudo systemctl restart plug
sudo systemctl status plug

sudo systemctl enable autossh@5000
sudo systemctl start autossh@5000
sudo systemctl status autossh@5000
