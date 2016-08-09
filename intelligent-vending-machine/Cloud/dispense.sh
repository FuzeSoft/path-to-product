#!/bin/bash

# partion key - use MAC address
PARTITION_KEY=`cat /sys/class/net/[e]*/address | head -1`
if [ -z "$PARTITION_KEY" ]; then
	PARTITION_KEY=`cat /sys/class/net/[w]*/address | head -1`
fi

if [ -z "$PARTITION_KEY" ] ; then
	echo "Error: Unable to determine partition key"
	exit 1
fi

export PARTITION_KEY

# credentials
export AZURE_STORAGE_ACCOUNT='iotvendingmachine'
export AZURE_STORAGE_ACCESS_KEY='gxl9iSmeDPnBVU2m8uqMZUGYbHtoGkDxr9HO2DybPKMLSK1srYxcKPCqrJePXZxfldtmWSSDalKO3vA0szuXbw=='
# proxy
export HTTP_PROXY=http://proxy.jf.intel.com:911
export HTTPS_PROXY=http://proxy.jf.intel.com:911

node dispense.js
