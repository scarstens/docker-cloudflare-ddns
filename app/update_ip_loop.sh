#!/bin/bash
while true; do
    public_ip=$(dig +short myip.opendns.com @resolver1.opendns.com)
    if [[ -z $(cfcli listrecords -f csv | grep A,$CF_RECORD,$public_ip) ]] ; then
        echo 'IP Address Changed, requires updating: '$(cfcli listrecords -f csv | grep A,$CF_RECORD)
        cfcli editrecord $CF_RECORD $public_ip -l 1
    else
        echo "Record matches public IP ($public_ip): "$(cfcli listrecords -f csv | grep A,$CF_RECORD,$public_ip)
    fi
    sleep 2m
done