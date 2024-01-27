FROM debian:bookworm

RUN apt update
RUN apt install -y suricata python3 python3-pip pipenv
RUN pipenv install suricata-update
RUN pipenv run suricata-update

#suricata -S /var/lib/suricata/rules/suricata.rules -r /mnt/artifacts/pcap/packetcapture.pcapng
