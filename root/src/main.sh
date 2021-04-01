#!/bin/bash

continue=TRUE
interval=10

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

		echo "sleeping for $interval"
		sleep $interval
	done
}

node_init
node_loop
