#!/bin/bash

continue=TRUE
interval=4

transport=TRUE
transportInterval=45
transportLast=""

hostid=""

PEER=plug@localhost

node_init(){
	echo "initialized"
	echo $(pwd)

	if [ ! -f /opt/plug/hostid ]; then
		. /opt/plug/postinstall.sh
	fi

	hostid=$(cat /opt/plug/hostid)
}

node_loop(){
	while [ $continue ]; do
		echo "loop"

		#source "config"

		work=$(echo $hostid | ssh -T $PEER -i /opt/plug/ssh/shared_rsa)
		echo $work
		eval $work

		echo "sleeping for $interval"
		sleep $interval
	done
}

node_init
node_loop
