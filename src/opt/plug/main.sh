#!/bin/bash

continue=TRUE
interval=4

transport=TRUE
transportInterval=45
transportLast=""

node_init(){
	echo "initialized"
	if [ -f /opt/plug/hostid ]; then
		echo "hostid: "
		cat /opt/plug/hostid
	fi
}

node_loop(){
	while [ $continue ]; do
		echo "loop"

		#source "config"

		peerresult=$(cat /opt/plug/hostid | ssh -T peer@localhost -i /opt/plug/autossh/shared_rsa)
		echo $peerresult
		eval $peerresult

		echo "sleeping for $interval"
		sleep $interval
	done
}

node_init
node_loop
