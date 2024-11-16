#!/bin/bash

[ -f /tmp/gcp_mutex ] && exit
LOGS="/mnt/artifacts/gcp/"
find $LOGS -name *.json -exec cat {} \; | jq '.[]' | sed -z 's/}\n{/}\n\n{/g'
touch /tmp/gcp_mutex
