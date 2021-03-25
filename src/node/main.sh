#!/bin/bash

continue=TRUE
interval=10

node_init(){
	echo "initialized"
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
