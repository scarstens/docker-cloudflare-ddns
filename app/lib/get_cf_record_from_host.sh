#!/usr/bin/env bash
function get_cf_record_from_host () {
    echo "Converting CF_HOST ($CF_HOST ) " >&2
    echo "  into CF_RECORD" >&2
    host=$(grep '://' <<< $CF_HOST)
    if [[ -z $host ]] ;
    then
        CF_URL=$CF_HOST ;
    else
        CF_URL=$(awk -F// '{print $1}' <<< $CF_HOST) ;
    fi ;

    if [[ -z $(awk -F. '{print $(NF-2)}' <<< $CF_URL) ]] ; then CF_RECORD=$CF_DOMAIN ; else CF_RECORD=$(awk -F. '{print $(NF-2)}' <<< $CF_URL) ; fi ;

    # echo used to return value to entrypoint
    echo "  Returning CF_RECORD" >&2
    echo $CF_RECORD
}
export -f get_cf_record_from_host
echo " ...get_cf_record_from_host"