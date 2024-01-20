# Splunk4DFIR

## Description

Quickly spin up a splunk instance to browse through logs and tools output during your investigations.

This is a simple quality of life improvement project built upon the amazing work below:

- https://github.com/whikernel/evtx2splunk/tree/main
- https://github.com/splunk/docker-splunk

## HOW-TO

Drop your files under the appropriate folder in `artifacts/` then build and run the container.

```
sudo docker build -t splunk4dfir .
sudo docker run --name splunk4dfir -e SPLUNK_START_ARGS=--accept-license -e SPLUNK_PASSWORD=changeme -p 8000:8000 -p 8089:8089 -v ./artifacts:/mnt/artifacts splunk4dfir:latest start
sudo docker exec -it splunk4dfir sudo /opt/splunk/etc/apps/Splunk4DFIR/bin/ingest_evtx.sh
```

goto: http://127.0.0.1:8000/en-US/app/launcher/home

## Supported inputs

- `artifacts/json/`: drop there arbitrary json files
- `artifacts/cloudtrail/`: drop there exported cloudtrail logs
- `artifacts/evtx/`: drop there windows logs evtx files
