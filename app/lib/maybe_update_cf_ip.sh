#!/bin/bash
##################################################################
# Purpose: Converts a string to lower case
# Arguments:
#   $1 -> String to convert to lower case
##################################################################
function maybe_update_cf_ip ()
{
    public_ip=$(dig +short myip.opendns.com @resolver1.opendns.com)

    echo "Public IP from DNS dig: "$public_ip
    echo "Checking against CloudFlare record: "$CF_RECORD

    search_for_record=$(cfcli listrecords -f csv | grep A,$CF_RECORD,$public_ip)
    echo "$search_for_record"

    if [[ -z $search_for_record ]] ; then
        echo "IP Address Changed, requires updating: [CF:$CF_RECORD,PUB:$public_ip]"
        cfcli editrecord $CF_RECORD $public_ip -l 1
    else
        echo "Record matches public IP ($public_ip): "$(cfcli listrecords -f csv | grep A,$CF_RECORD,$public_ip)
    fi
}
export -f maybe_update_cf_ip
echo " ...maybe_update_cf_ip"