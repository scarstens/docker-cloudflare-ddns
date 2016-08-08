#!/bin/bash
#export CF_RECORD=$(bash /app/get_dns_record_from_domain.sh)
#break;
echo "Docker Entrypoint Loaded"
# load all library functions
echo " Loading function library..."
for f in /app/lib/*.sh; do source $f; done

#source /app/get_cf_domain_from_host.sh
bash /app/run.sh