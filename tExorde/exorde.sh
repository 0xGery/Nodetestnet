echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo -e "\033[0;35m"
echo " 	 ######   ######  ########  ##    ##  #######  ######## ####  ######   ";
echo "  ##    ## ##    ## ##     ##  ##  ##  ##     ##    ##     ##  ##    ##  ";
echo "  ##       ##       ##     ##   ####   ##     ##    ##     ##  ##        ";
echo "   ######  ##       ########     ##    ##     ##    ##     ##  ##        ";
echo "        ## ##       ##   ##      ##    ##     ##    ##     ##  ##        ";
echo "  ##    ## ##    ## ##    ##     ##    ##     ##    ##     ##  ##    ##  ";
echo "   ######   ######  ##     ##    ##     #######     ##    ####  ######   ";
echo -e "\e[0m"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

sleep 2

if [ ! $Address ]; then
	read -p "Input your 0x Address: " Address
	echo 'export Address='$Address >> $HOME/.bash_profile
fi

source $HOME/.bash_profile

echo '================================================='
echo -e "Your 0x Address: \e[1m\e[32m$Address\e[0m"
echo '================================================='

sleep 2

echo -e "\e[1m\e[32m1. Installing Docker... \e[0m" && sleep 1
sudo apt update -y && sudo apt install apt-transport-https ca-certificates curl software-properties-common -y && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" && sudo apt install docker-ce

echo -e "\e[1m\e[32m2. Installing Screen... \e[0m" && sleep 1
sudo apt install -y build-essential libssl-dev libffi-dev git curl screen

echo -e "\e[1m\e[32m2. cloning github... \e[0m" && sleep 1
cd $Home
git clone https://github.com/exorde-labs/ExordeModuleCLI.git

echo -e "\e[1m\e[32m2. Docker Build... \e[0m" && sleep 1
cd ExordeModuleCLI
docker build -t exorde-cli .

echo -e "\e[1m\e[32m2. Docker Run... \e[0m" && sleep 1
screen -S exorde
