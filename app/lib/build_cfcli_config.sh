#!/bin/bash

function build_cfcli_config () {
    rm -f /root/.cfcli.yml
    touch /root/.cfcli.yml
    chmod 660 /root/.cfcli.yml

    echo "defaults:" >> /root/.cfcli.yml
    echo "    email: $CF_EMAIL" >> /root/.cfcli.yml
    echo "    domain: $CF_DOMAIN" >> /root/.cfcli.yml
    echo "    token: $CF_API" >> /root/.cfcli.yml

    echo "Built config file for cfcli: "$(head -3 /root/.cfcli.yml)
}
export -f build_cfcli_config
echo " ...build_cfcli_config"