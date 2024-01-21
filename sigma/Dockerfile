FROM debian:bookworm

RUN apt update
RUN apt install -y python3 python3-pip pipenv git
RUN pipenv install sigma-cli
RUN pipenv run sigma plugin install splunk

#sudo docker run -it --name sigma-cli --rm -v ./rules:/mnt/rules -v ./pipelines:/mnt/pipelines sigma-cli:latest pipenv run sigma convert -t splunk -p /mnt/pipelines/evtx2splunk.yml /mnt/rules/sigma/rules/windows/process_creation/ -s

