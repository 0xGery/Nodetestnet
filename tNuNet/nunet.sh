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

if [ ! $nAddress ]; then
	read -p "Input your 0x Address: " nAddress
	echo 'export Address='$nAddress >> $HOME/.bash_profile
fi
source $HOME/.bash_profile
if [ ! $nPrivateKey ]; then
	read -p "Input your Private Key: " nPrivateKey
	echo 'export PrivateKey='$nPrivateKey >> $HOME/.bash_profile
fi
source $HOME/.bash_profile

echo '================================================='
echo -e "Your Address: \e[1m\e[32m$nAddress\e[0m"
echo -e "Your PrivateKey: \e[1m\e[32m$nPrivateKey\e[0m"
echo '================================================='

sleep 2

echo -e "\e[1m\e[32m1. Downloading DMS... \e[0m" && sleep 1
cd $home && wget https://d.nunet.io/nunet-dms-latest.deb

echo -e "\e[1m\e[32m2. Installing DMS... \e[0m" && sleep 1
sudo apt update && sudo apt install ./nunet-dms-latest.deb

