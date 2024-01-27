#!/bin/bash

[ -f /tmp/zeek_mutex ] && exit
LOGS="/mnt/artifacts/zeek/"
for file in $(find $LOGS -name *.log); do cat $file | jq --arg file $file '. + {"log_file": $file}' ;done | sed -z 's/}\n{/}\n\n{/g'
touch /tmp/zeek_mutex

