FROM splunk/splunk:latest

USER root
RUN microdnf -y --nodocs install jq
COPY --chown=splunk:splunk ./Splunk4DFIR /opt/splunk/etc/apps/Splunk4DFIR
USER ansible
