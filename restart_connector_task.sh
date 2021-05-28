#!/bin/bash

######################
#
# Script  : restart_connector_task.sh
# Function: Collect connector data
# Input   : Connector API
# Output  : LLD data file for zabbix
# Usage   : restart_connector_task.sh $1 from zabbix action
# User    : root
# Version : 1.0 / 18/02/2021  - initial version
# Owner   : r.schouw@fullstaq.com
######################

LOG=/var/log/zabbix/restarted-connector.log
value=$(echo $1 | awk -F "/" '{print $(NF)}')
echo $value
CONNECTOR=$(echo ${value::-2})
IDS=$(echo ${value:(-1)})

curl -v -X POST http://localhost:36001/connectors/"{$CONNECTOR}"/tasks/"{$IDS}"/restart 2>&1 | tee -a $LOG
echo "Connector $CONNECTOR ID $IDS has been restarted at $(date)" >> $LOG
~
~

