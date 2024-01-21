FROM debian:bookworm

RUN apt update
RUN apt install -y python3 python3-pip pipenv git
RUN pipenv install sigma-cli
RUN pipenv run sigma plugin install splunk


