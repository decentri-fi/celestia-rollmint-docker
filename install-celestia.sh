cd $HOME
export PATH=$PATH:/usr/local/go/bin
rm -rf celestia-node
git clone https://github.com/celestiaorg/celestia-node.git
cd celestia-node/
git checkout tags/v0.6.1
make install
make cel-key