# Celestia lightnode and Rollmint rollup

This repository contains the code for the Celestia lightnode and Rollmint rollup.

In order to successfully launch, you'll have to:
- build
- launch celestia node
- launch rollup

## Building

### Prerequisites
- docker

### Build
```bash
./app.js build
```

## Celestia lightnode

The Celestia lightnode is a light client for the Celestia blockchain. 

### Running

```bash
./app.sh celestia
```

## Rollmint rollup

The Rollmint rollup is a rollup for the Celestia blockchain.

### Running

```bash
./app.sh rollup
```

### Further optimizations

- convert dockerfiles to builder patterns. This will reduce the size of the final images.
- map folders to local folders, so we can edit the code locally and have it reflected in the container.

### Caveats 

- The build scaffolds an entire blockchain using ignite. This is build step that takes a considerable amount of time. 
- The documentation states that before we can init the rollup, we need to do the following.
  - Before starting our rollup, we'll need to find and change FlagIAVLFastNode to FlagDisableIAVLFastNode: 
  - 
  This is not necessary, as the flag is already set to FlagDisableIAVLFastNode in the config.toml file.
- the celestia logs are filled with warnings. According to the devs, this is normal.


Necessary steps to get this running:

#### Accounts

When starting up the rollup, it complains about the following
- "rpc error: code = NotFound desc = account celestia13ux04z9s7ex44kcsvnwja6644ns340xurgj5tp not found" attempt=13 module=BlockManager

In order to submit the data transactions containing the state of your rollup, you need to fund that account. Fund it by sending TIA to the address, or by requesting TIA on their discord (#mocha-faucet).

#### Block Visibility

When actively running the rollup, its state will be published to the mocha testnet. You can see the data being posted under the **transactions** subsection.

<img width="1276" alt="image" src="https://user-images.githubusercontent.com/2153990/216989747-52bfdc2e-955f-4347-abdc-5929b5519a22.png">


#### Arabica

In context of the following remark:
https://github.com/rollkit/rollkit/issues/667#issuecomment-1360423279

We did not have to apply the 3d change in the suggestion, as we are using the Mocha testnet instead of Arabica. Bear in mind that this needs to be done when using the arabica testnet.
