ver="1.19.1"
cd $HOME
wget "https://golang.org/dl/go$ver.linux-amd64.tar.gz"
rm -rf /usr/local/go
tar -C /usr/local -xvzf "go$ver.linux-amd64.tar.gz"
export PATH=$PATH:/usr/local/go/bin
go version
rm "go$ver.linux-amd64.tar.gz"