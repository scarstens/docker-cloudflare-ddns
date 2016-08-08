#!/usr/bin/env bash
function get_cf_domain_from_host () {
    echo "Converting CF_HOST ($CF_HOST ) " >&2
    echo "  into CF_DOMAIN" >&2
    host=$(grep '://' <<< $CF_HOST)
    if [[ -z $host ]] ;
    then
        CF_URL=$CF_HOST ;
    else
        CF_URL=$(awk -F// '{print $1}' <<< $CF_HOST) ;
    fi ;

    CF_DOMAIN=$(awk -F. '{print $(NF-1)"."$(NF)}' <<< $CF_URL)

    # echo used to return value to entrypoint
    echo "  Returning $CF_DOMAIN" >&2
    echo $CF_DOMAIN
}
export -f get_cf_domain_from_host
echo " ...get_cf_domain_from_host"