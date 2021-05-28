#!/bin/sh

######################
#
# Script  : check_task_connector.sh
# Function: Collect connector state
# Input   : Connector API
# Output  : Item data for zabbix
# Usage   : zabbix userparameter
# User    : zabbix
# Version : 1.0 / 18/02/2021  - initial version
# Note    : script fails when IDS >9
# Owner   : r.schouw@fullstaq.com
######################

value=$1
CONNECTOR=$(echo ${value::-2})
IDS=$(echo ${value:(-1)})

cat /etc/zabbix/zabbix_agentd.d/check_connectors | jq --arg CONNECTOR "${CONNECTOR}" --arg IDS '${IDS}'  -r '."'${CONNECTOR}'" | .status.tasks[]| select(.id=='$IDS').state'
~
~

