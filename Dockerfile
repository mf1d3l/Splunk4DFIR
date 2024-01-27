FROM splunk/splunk:latest

RUN sudo microdnf -y --nodocs install jq
RUN sudo microdnf -y --nodocs install git
COPY --chown=splunk:splunk ./Splunk4DFIR /opt/splunk/etc/apps/Splunk4DFIR
RUN sudo git clone https://github.com/whikernel/evtx2splunk.git /opt/splunk/etc/apps/Splunk4DFIR/bin/evtx2splunk
RUN sudo chown -R splunk:splunk /opt/splunk/etc/apps/Splunk4DFIR/bin/evtx2splunk 
RUN sudo pip3 install -r /opt/splunk/etc/apps/Splunk4DFIR/bin/evtx2splunk/requirements.txt
