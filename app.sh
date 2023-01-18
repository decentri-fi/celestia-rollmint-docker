#!/usr/bin/zsh

if [[ -z "$1" ]]; then
    echo "Please provide an option to run"
    echo "possible options are: build, celestia or rollup"
    exit 1
fi

if [[ "$1" == "build" ]]; then
    echo "Building celestia-light-node"
    sh build.sh
elif [[ "$1" == "celestia" ]]; then
    echo "Running celestia-light-node"
    docker run --name celestia-light -d -p 127.0.0.1:26659:26659 celestia-light
elif [[ "$1" == "rollup" ]]; then
    echo "Running rollup-node"
    docker run --name rollmint -p 127.0.0.1:26657:26657 rollmint
else
    echo "Please provide a valid option"
    echo "possible options are: build, celestia or rollup"
    exit 1
fi
