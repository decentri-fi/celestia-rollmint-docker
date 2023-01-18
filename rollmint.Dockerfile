FROM ubuntu:20.04

RUN apt update && apt upgrade -y && apt install curl wget -y
ADD install-go.sh /install-go.sh
RUN . /install-go.sh
ADD ignite.sh /ignite.sh
RUN . /ignite.sh