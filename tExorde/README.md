### Step 1
```
wget -O exorde.sh https://raw.githubusercontent.com/scryotic-tech/Nodetestnet/main/tExorde/exorde.sh && chmod +x exorde.sh && ./exorde.sh
```
### Step 2
Input your 0x Address

### Step 3
```
docker run -it exorde-cli -m $Address -l 4
```

### step 4 Exit from screen
CTRL A + D


### Enter Screen
```
screen -rd exorde
```
