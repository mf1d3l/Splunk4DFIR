#!/bin/bash

[ -f /tmp/zeek_mutex ] && exit
LOGS="/mnt/artifacts/zeek/"
find $LOGS -name *.log -exec cat {} \; | jq '.' | sed -z 's/}\n{/}\n\n{/g'
touch /tmp/zeek_mutex

