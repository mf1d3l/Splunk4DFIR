FROM debian:bookworm

RUN apt update
RUN apt install -y suricata python3 python3-pip pipenv
RUN pipenv install suricata-update
RUN pipenv run suricata-update
