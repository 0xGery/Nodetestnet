echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo -e "\033[0;35m"
echo "    _____                       _   _        ";
echo "   / ____|                     | | (_)       ";
echo "  | (___   ___ _ __ _   _  ___ | |_ _  ___   ";
echo "   \___ \ / __| '__| | | |/ _ \| __| |/ __|  ";
echo "   ____) | (__| |  | |_| | (_) | |_| | (__   ";
echo "  |_____/ \___|_|   \__, |\___/ \__|_|\___|  ";
echo "                     __/ |                   ";
echo "                    |___/                    ";
echo -e "\e[0m"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

sleep 2

echo -e "\e[1m\e[32m1. Downloading DMS... \e[0m" && sleep 1
cd $HOME && wget https://d.nunet.io/nunet-dms-latest.deb

echo -e "\e[1m\e[32m2. Installing DMS... \e[0m" && sleep 1
sudo apt update && sudo apt install ./nunet-dms-latest.deb

echo -e "\e[1m\e[32m3. DMS status... \e[0m" && sleep 1
systemctl status nunet-dms

sleep 2

echo -e "\e[1m\e[32m4. Do you have 0x Address? \e[0m" && sleep 1

OPTIONS="Yes No"

select opt in $OPTIONS; do
    if [ "$opt" = "Yes" ]; then 
        break
    elif [ "$opt" = "No" ]; then
    	echo -e "\e[1m\e[32mCreating New Wallet...  \e[0m" && sleep 1
        nunet wallet new
	break
    fi
done
        
sleep 2

if [ ! $nAddress ]; then
	read -p "Input your 0x Address: " nAddress
	echo 'export nAddress='$nAddress >> $HOME/.bash_profile
fi
source $HOME/.bash_profile
if [ ! $nPrivateKey ]; then
	read -p "Input your Private Key: " nPrivateKey
	echo 'export nPrivateKey='$nPrivateKey >> $HOME/.bash_profile
fi
source $HOME/.bash_profile

echo '================================================='
echo -e "Your Address: \e[1m\e[32m$nAddress\e[0m"
echo -e "Your PrivateKey: \e[1m\e[32m$nPrivateKey\e[0m"
echo '================================================='

sleep 2

source $HOME/.bash_profile

echo -e "\e[1m\e[32m5. Checking your Memory & CPU... \e[0m" && sleep 1
nunet available --pretty

sleep 2

if [ ! $nMem ]; then
	read -p "Input your Memory: " nMem
	echo 'export nMem='$nMem >> $HOME/.bash_profile
fi
source $HOME/.bash_profile
if [ ! $nCPU ]; then
	read -p "Input your CPU: " nCPU
	echo 'export nCPU='$nCPU >> $HOME/.bash_profile
fi
source $HOME/.bash_profile

sleep 1
echo -e "\e[1m\e[32m6. Deleting trash... \e[0m" && sleep 1
rm nunet.sh
rm nunet-dms-latest.deb

echo -e "\e[1m\e[32m7. Nunet Onboarding... \e[0m" && sleep 1
nunet onboard -m $nMem -c $nCPU -n nunet-test -a $nAddress
