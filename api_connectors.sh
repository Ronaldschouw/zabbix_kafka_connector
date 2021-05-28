#!/bin/bash
#
# Script  : api_connectors.sh
# Function: Collect connector data
# Input   : Connector API
# Output  : data file for zabbix LLDiscovery
# Usage   : by zabbix
# User    : root
# Version : 1.0 / 18/02/2021  - initial version
# Owner   : r.schouw@fullstaq.com
######################

curl http://localhost:36001/connectors?expand=status | jq > /etc/zabbix/zabbix_agentd.d/check_connectors
curl http://localhost:36001/connectors | jq .[] > /etc/zabbix/zabbix_agentd.d/get_connectors

