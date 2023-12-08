# DuskNode
## Ubuntu 22.10 

### Install essential
```
sudo apt-get update && sudo apt-get install -y tar wget curl
```

### Download Libs
```
wget http://nz2.archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2.16_amd64.deb && sudo dpkg -i libssl1.1_1.1.1f-1ubuntu2.16_amd64.deb
```

### Download Rusk Wallet
```
cd $HOME && wget https://github.com/dusk-network/wallet-cli/releases/download/v0.12.0/ruskwallet0.12.0-linux-x64.tar.gz
```

### extract and Run rusk wallet
```
tar -xf ruskwallet0.12.0-linux-x64.tar.gz && cd cd ruskwallet0.12.0-linux-x64
```

### Run Wallet
```
./rusk-wallet
```

* Choose `Create a new wallet`
* Input New password 
* Repeate New password
* Copy and Save mnemonic 
* Choose created wallet
* Choose `Export provisioner key-pair`

### Save key-pair

Make sure your key-pair have been exported
```
cd $HOME && cd .dusk/rusk-wallet
```

### Rename [YourAddress].key to consensus.keys
```
mv AddressMu.key consensus.keys
```

## Faucet
[Click Here](https://forms.gle/3h4wDbab9f6bZ68L8) to get Faucet

### Open Port
```
ufw allow 9000:9005/udp
```
```
ufw allow 22/tcp
```
```
ufw enable
```

### Download Node service
```
curl --proto '=https' --tlsv1.2 -sSf https://dusk-infra.ams3.digitaloceanspaces.com/rusk/itn-installer.sh | sh
```

### Move consensus.keys file to node service
```
mv $(ls -a .dusk/rusk-wallet | grep *.keys) /opt/dusk/conf/consensus.keys
```

### Set password `consensus.keys`

```
echo 'DUSK_CONSENSUS_KEYS_PASS=InputPasswordMu' > /opt/dusk/services/dusk.conf
```

### Run node

```
service rusk start
```
```
service dusk start
```

### Check node service
```
service rusk status
```
```
service dusk status
```
