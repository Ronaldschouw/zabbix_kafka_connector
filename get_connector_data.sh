#!/bin/bash

######################
#
# Script  : get-connector-data.sh
# Function: Collect connector and task data
# Input   : Connector API / get_connectors
# Output  : LLD data file for zabbix
# Usage   : zabbix userparameter
# User    : zabbix
# Version : 1.0 / 18/02/2021  - initial version
# Owner   : r.schouw@fullstaq.com
######################

CONNECTOR=$(cat /etc/zabbix/zabbix_agentd.d/get_connectors)
CONNECTOR_IDS=$(cat /etc/zabbix/zabbix_agentd.d/get_connectors | tr -d \")
FIRST="1"

#create zabbix lld discovery connectoren

echo "{"
echo "  \"data\":["

for i in $CONNECTOR
do
  if [ "$FIRST" -eq "0" ]
  then
  printf ",\n"
  fi

  FIRST="0"
  printf "    {\"{#CONNECTOR}\": $i}"
done

#create zabbix lld discovery task connectoren

for i in $CONNECTOR_IDS
do
IDS=$(cat /etc/zabbix/zabbix_agentd.d/check_connectors | jq --arg i ${i} -r '."'${i}'"| .status.tasks[].id')
  for z in $IDS
  do
    if [ "$FIRST" -eq "0" ]
    then
    printf ",\n"
    fi

    FIRST="0"
    printf "    {\"{#CONNECTOR_ID}\": \"${i}-${z}\"}"
  done
done

printf "\n  ] \n}"

