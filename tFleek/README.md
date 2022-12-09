# FLEEK NODE

[Beta waitlist registration](https://fleek.xyz/)

Join our telegram Group [Here](https://t.me/WonCryptoClass3)
# Installation Node

### Step 1
Install screen and create screen
```
Sudo apt-get install screen wget && screen -rd fleek
```
### Step 2
Install Node
```
wget -O tfleek.sh https://raw.githubusercontent.com/scryotic-tech/Nodetestnet/main/tFleek/tfleek.sh && chmod +x tfleek.sh && ./tfleek.sh
```

# Important Command

### Stop the Docker container
```
docker stop ursa-cli
```
### Restart the Docker container
```
docker start ursa-cli
```
### Delete the Docker container
```
docker rm ursa-cli
```
### Execute Ursa CLI commands in the container
```
docker exec -it ursa-cli /ursa --version
```
If successfull, you’ll get the version number `ursa 0.1.0`. beware that version might differ from time of writing, as Ursa is in constant development
### Execute bash shell in the container
```
docker exec -it ursa-cli bash
```
