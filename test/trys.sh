#!/bin/bash


function CheckDir {
    if [ ! -d $1 ]; then
        return 1;
    else 
        return 0;
    fi
}

CheckDir 