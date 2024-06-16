#!/bin/bash

[ -f /tmp/memprocfs_mutex ] && exit
LOGS="/mnt/artifacts/memprocfs/"
find $LOGS -name *.json -exec cat {} \; | jq '.' | sed -z 's/}\n{/}\n\n{/g'
touch /tmp/memprocfs_mutex
