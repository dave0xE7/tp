#!/bin/bash

BASE_PATH=/home/service/dev/tp

test(){
	echo "test installing node"

	echo "test uninstalling node"

	echo "running main.sh"
	bash $BASE_PATH/src/node/main.sh

	echo "finish!"
}


test
