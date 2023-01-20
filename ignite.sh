#!/usr/bin/env bash
export PATH=$PATH:/usr/local/go/bin
curl https://get.ignite.com/cli! | bash
ignite scaffold chain gm
cd gm
go mod edit -replace github.com/cosmos/cosmos-sdk=github.com/celestiaorg/cosmos-sdk-rollmint@v0.46.7-rollmint-v0.5.0-no-fraud-proofs
go mod edit --replace github.com/tendermint/tendermint=github.com/celestiaorg/tendermint@v0.34.22-0.20221013213714-8be9b54c8c21
go mod tidy
go mod download
ignite chain build

