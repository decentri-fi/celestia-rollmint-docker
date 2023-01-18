FROM ubuntu:20.04

RUN apt update && apt upgrade -y
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt install curl tar wget clang pkg-config libssl-dev jq build-essential git make ncdu -y
ADD install-go.sh /install-go.sh
RUN . /install-go.sh
ADD install-celestia.sh /install-celestia.sh
RUN . /install-celestia.sh
RUN celestia light init --p2p.network mocha
CMD ["celestia",  "light",  "start",  "--core.ip", "https://rpc-mocha.pops.one", "--gateway", "--gateway.addr", "0.0.0.0", "--p2p.network","mocha"]




