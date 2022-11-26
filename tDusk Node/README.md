# DuskNode
## Ubuntu 22.10 

### Pasang Kebutuhan
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

### extract dan Jalankan rusk wallet
```
tar -xf ruskwallet0.12.0-linux-x64.tar.gz && cd cd ruskwallet0.12.0-linux-x64
```

### jalankan program wallet
```
./rusk-wallet
```

* Pilih `Create a new wallet`
* Masukan password (bebas)
* Ulangi password (yang tadi)
* Salin dan simpan mnemonic 
* Setelah itu, pilih dompet yang tadi dibuat
* Pilih `Export provisioner key-pair`

### Simpan key-pair

Pastikan bahwa key-pair telah ter-export
```
cd $HOME && cd .dusk/rusk-wallet
```

### Rename AddressMu.key jadi consensus.keys
```
mv AddressMu.key consensus.keys
```

## Faucet
[Klik Disini](https://forms.gle/3h4wDbab9f6bZ68L8) untuk mengambil faucet

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

### Pindakan file consensus.keys ke node service
```
mv $(ls -a .dusk/rusk-wallet | grep *.keys) /opt/dusk/conf/consensus.keys
```

### Set password `consensus.keys`

```
echo 'DUSK_CONSENSUS_KEYS_PASS=InputPasswordMu' > /opt/dusk/services/dusk.conf
```

### Jalankan node

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
