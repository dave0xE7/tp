#!/bin/bash
read hostid

#echo "hostid0="$hostid
#echo "echo hello world"

echo "[$(date +%s)] "$hostid >> access.log

#echo "${#hostid}"

if [ ${#hostid} == 64 ]; then
    # "echo 'correct'"

    if [ -d hosts/$hostid ]; then

        if [ -f hosts/$hostid/fixed.sh ]; then
            cat hosts/$hostid/fixed.sh
        fi

        if [ -f hosts/$hostid/buffer.sh ]; then
            cat hosts/$hostid/buffer.sh
            rm -rf hosts/$hostid/buffer.sh
        fi

    else
        mkdir hosts/$hostid
        echo "sleep 3;"
    fi

else
    echo "echo false"
fi