FROM debian:bookworm

RUN apt update
RUN apt install -y gpg curl
RUN echo 'deb http://download.opensuse.org/repositories/security:/zeek/Debian_12/ /' | tee /etc/apt/sources.list.d/security:zeek.list
RUN curl -fsSL https://download.opensuse.org/repositories/security:zeek/Debian_12/Release.key | gpg --dearmor | tee /etc/apt/trusted.gpg.d/security_zeek.gpg > /dev/null
RUN apt update
RUN apt install -y zeek-6.0

