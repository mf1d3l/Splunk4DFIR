#!/bin/bash

[ -f /tmp/suricata_mutex ] && exit
LOGS="/mnt/artifacts/suricata/"
find $LOGS -name *.json -exec cat {} \; | jq '.' | sed -z 's/}\n{/}\n\n{/g'
touch /tmp/suricata_mutex

