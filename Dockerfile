FROM splunk/splunk:latest

RUN sudo microdnf -y --nodocs install jq git
COPY --chown=splunk:splunk ./Splunk4DFIR /opt/splunk/etc/apps/Splunk4DFIR
RUN sudo git clone https://github.com/whikernel/evtx2splunk.git /opt/splunk/etc/apps/Splunk4DFIR/bin/evtx2splunk
RUN sudo chown -R splunk:splunk /opt/splunk/etc/apps/Splunk4DFIR/bin/evtx2splunk 
RUN sudo pip3 install -r /opt/splunk/etc/apps/Splunk4DFIR/bin/evtx2splunk/requirements.txt
RUN sudo curl https://raw.githubusercontent.com/mthcht/ThreatHunting-Keywords/main/threathunting-keywords.csv -o /opt/splunk/etc/apps/Splunk4DFIR/lookups/threathunting-keywords.csv
RUN sudo curl https://raw.githubusercontent.com/magicsword-io/LOLDrivers/main/loldrivers.io/content/api/drivers.csv -o /opt/splunk/etc/apps/Splunk4DFIR/lookups/loldrivers.csv
RUN sudo chown -R splunk:splunk /opt/splunk/etc/apps/Splunk4DFIR/lookups/
