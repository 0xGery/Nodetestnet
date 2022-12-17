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

if [ ! $$ValidatorName ]; then
	read -p "Input your Validator Name: " ValidatorName
	echo 'export ValidatorName='$ValidatorName >> $HOME/.bash_profile
fi
source $HOME/.bash_profile

sleep 1

echo -e "\e[1m\e[32m1. Downloading & Installing Essential package... \e[0m" && sleep 1
cd $HOME
sudo apt-get update && sudo apt install jq && sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sudo mkdir -p /etc/apt/keyrings && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo chmod a+r /etc/apt/keyrings/docker.gpg && sudo apt-get update && sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

echo -e "\e[1m\e[32m2. Cloning Repository... \e[0m" && sleep 1
git clone https://gitlab.com/q-dev/testnet-public-tools.git

echo -e "\e[1m\e[32m3. Creating Directory... \e[0m" && sleep 1
mkdir -p /root/testnet-public-tools/testnet-validator/keystore

echo -e "\e[1m\e[32m4. Creating wallet... \e[0m" && sleep 1
cd ~/testnet-public-tools/testnet-validator
touch keystore/pwd.txt

sleep 1

if [ ! $Pwde ]; then
	read -p "Enter new wallet password: " Pwde
	echo $Pwde >> $HOME/testnet-public-tools/testnet-validator/keystore/pwd.txt
fi

sleep 1

docker run --entrypoint="" --rm -v $PWD:/data -it qblockchain/q-client:testnet geth account new --datadir=/data --password=/data/keystore/pwd.txt
