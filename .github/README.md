# Celestia lightnode and Rollmint rollup

This repository contains the code for the Celestia lightnode and Rollmint rollup.

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


Next steps:

The rollup complains about the following
- "rpc error: code = NotFound desc = account celestia13ux04z9s7ex44kcsvnwja6644ns340xurgj5tp not found" attempt=13 module=BlockManager
Further investigation would be needed to create the correct account.