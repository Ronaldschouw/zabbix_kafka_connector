#!/bin/sh

######################
#
# Script  : check_connector.sh
# Function: Collect connector state
# Input   : Connector API
# Output  : Item data for zabbix
# Usage   : zabbix userparameter
# User    : zabbix
# Version : 1.0 / 18/02/2021  - initial version
# Owner   : r.schouw@fullstaq.com
######################

CONNECTOR="$1"
cat /etc/zabbix/zabbix_agentd.d/check_connectors | jq --arg CONNECTOR "${CONNECTOR} " -r '."'${CONNECTOR}'" | .status.connector.state'

