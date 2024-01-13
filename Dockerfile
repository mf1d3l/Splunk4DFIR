FROM splunk/splunk:latest

COPY --chown=splunk:splunk ./Splunk4DFIR /opt/splunk/etc/apps/Splunk4DFIR

