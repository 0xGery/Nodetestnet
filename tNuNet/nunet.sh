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

echo -e "\e[1m\e[32mDownloading DMS... \e[0m" && sleep 1
cd $HOME && wget https://d.nunet.io/nunet-dms-latest.deb

echo -e "\e[1m\e[32mInstalling DMS... \e[0m" && sleep 1
sudo apt update && sudo apt install ./nunet-dms-latest.deb

echo -e "\e[1m\e[32mDMS status... \e[0m" && sleep 1
systemctl show -p SubState nunet-dms | sed 's/SubState=//g'

sleep 2

while true; do
	read -p "Do you have 0x Address? (yes/no)" nWalResp
	case $nWalResp in
		yes ) break ;;
		no  ) 
    		echo -e "\e[1m\e[32mCreating New Wallet...  \e[0m" && sleep 1
			nWalletAddress=$(nunet wallet new)
			nAddress=$(echo $nWalletAddress | jq -r .address)
			echo "Your new wallet information used for NuNet: "
			echo -e "Address: \033[33m$(echo $nWalletAddress | jq -r .address)\033[0m"
			echo -e "PrivateKey: \033[33m$(echo $nWalletAddress | jq -r .private_key)\033[0m"
			break;;
		*   ) echo "Only 'yes' or 'no' please";;
	esac
done
        
sleep 2

if [ ! $nAddress ]; then
	read -p "Input your 0x Address: " nAddress
fi

source $HOME/.bash_profile

echo '================================================='
echo -e "Your Address: \e[1m\e[32m$nAddress\e[0m"
echo -e "Your PrivateKey: \e[1m\e[32m$nPrivateKey\e[0m"
echo '================================================='

sleep 2

source $HOME/.bash_profile

echo -e "\e[1m\e[32mChecking your Memory & CPU... \e[0m" && sleep 1
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
echo -e "\e[1m\e[32mDeleting trash... \e[0m" && sleep 1
rm nunet.sh
rm nunet-dms-latest.deb

echo -e "\e[1m\e[32mNunet Onboarding... \e[0m" && sleep 1
nunet onboard -m $nMem -c $nCPU -n nunet-test -a $nAddress
