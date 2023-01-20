#!/usr/bin/zsh

if [[ -z "$1" ]]; then
    echo "Please provide an option to run"
    echo "possible options are: build, celestia, rollup or clean"
    exit 1
fi

if [[ "$1" == "build" ]]; then
    echo "Building celestia-light-node"
    docker network create neworder
    sh build.sh
elif [[ "$1" == "celestia" ]]; then
    echo "Running celestia-light-node"
    docker run --network neworder --name celestia-light -d -p 26658:26658 -p 26659:26659 celestia-light
elif [[ "$1" == "rollup" ]]; then
    echo "Running rollup-node"
    docker run -d --network neworder --name rollmint -p 26657:26657 rollmint
elif [[ "$1" == "clean" ]]; then
    echo "Cleaning up"
    docker stop celestia-light
    docker rm celestia-light
    docker stop rollmint
    docker rm rollmint
else
    echo "Please provide a valid option"
    echo "possible options are: build, celestia, rollup or clean"
    exit 1
fi
