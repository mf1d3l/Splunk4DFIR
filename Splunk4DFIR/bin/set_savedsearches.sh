#!/bin/bash

[ -z "$1" ] && echo "you need to provide an argument" && exit 1

if [ "$1" = "enable" ]; then
  sed -i 's/^enableSched = 0/enableSched = 1/g' /opt/splunk/etc/apps/Splunk4DFIR/default/savedsearches.conf
elif [ "$1" = "disable" ]; then
  sed -i 's/^enableSched = 1/enableSched = 0/g' /opt/splunk/etc/apps/Splunk4DFIR/default/savedsearches.conf
else
  echo "unsupported argument"
  echo "use enable argument to enable all searches"
  echo "use disable argument to disable all searches"
  exit 1
fi

/opt/splunk/bin/splunk restart
