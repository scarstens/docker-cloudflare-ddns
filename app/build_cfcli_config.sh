#!/usr/bin/env bash
rm -f /root/.cfcli.yml
touch /root/.cfcli.yml

if [[ -z $(grep '://' <<< $CF_HOST) ]] ; then CF_URL=$CF_HOST ; else CF_URL=$(awk -F// '{print $1}' <<< $CF_HOST) ; fi ;
CF_DOMAIN=$(awk -F. '{print $(NF-1)"."$(NF)}' <<< $CF_URL)

if [[ -z $(awk -F. '{print $(NF-2)}' <<< $CF_URL) ]] ; then CF_RECORD=$CF_DOMAIN ; else CF_RECORD=$(awk -F. '{print $(NF-2)}' <<< $CF_URL) ; fi ;

echo "defaults:" >> /root/.cfcli.yml
echo "    token: $CF_API" >> /root/.cfcli.yml
echo "    email: $CF_EMAIL" >> /root/.cfcli.yml
echo "    domain: $CF_DOMAIN" >> /root/.cfcli.yml