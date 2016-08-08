#!/bin/bash

export CF_DOMAIN=$(get_cf_domain_from_host)
echo "CF_DOMAIN set to $CF_DOMAIN"

# Build the CloudFlare Config File at default location  /root/.cfcli.yml
build_cfcli_config

#establish record to update
get_cf_record_from_host

# Enable stopping container with sigterm
trap 'exit 0' SIGTERM

# Run service, loops infinately every 2 minutes to check for IP updates
while :
do
    maybe_update_cf_ip
    sleep 2m
done