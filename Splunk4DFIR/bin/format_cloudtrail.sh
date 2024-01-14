#!/bin/bash

[ -f /tmp/cloudtrail_mutex ] && exit
LOGS="/mnt/artifacts/cloudtrail/"
find $LOGS -name *.json -exec cat {} \; | jq '.Records[]' | sed -z 's/}\n{/}\n\n{/g'
touch /tmp/cloudtrail_mutex

