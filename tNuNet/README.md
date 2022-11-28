# Computer Provider

### Step 1
```
wget -O nunet.sh https://raw.githubusercontent.com/scryotic-tech/Nodetestnet/main/tNuNet/nunet.sh && chmod +x nunet.sh && ./nunet.sh
```
## Important Note

### Note that to be eligible for this, you must onboard at least 10,000MB of memory and 6,000MHz of compute capacity. In case of success, you will see the message Successfully Onboarded.
### Step 2
Wait 5 minutes to give some time for components to start

### Step 3
List the peers the nunet-adapter is connected to:
```
nunet peer list
```
#### Notes
If you received the message ```Looks like NuNet Adapter is not running```, follow the instructions again starting from [here](https://gitlab.com/nunet/documentation/-/wikis/Compute-provider-onboarding#install-dms). If it still doesn't work, please, submit a [bug report](https://gitlab.com/nunet/documentation/-/wikis/Contribution-Guidelines) to the issue tracker with the output of these commands:
```
sudo docker ps -a
```
and
```
ps aux |grep nunet
```
