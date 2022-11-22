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

if [ ! $ApiURL ]; then
	read -p "Masukin URL HTTPSmu: " ApiURL
	echo 'export ApiURL='$ApiURL >> $HOME/.bash_profile
fi

source $HOME/.bash_profile

echo '================================================='
echo -e "URL HTTPS: \e[1m\e[32m$ApiURL\e[0m"
echo '================================================='

sleep 2

echo -e "\e[1m\e[32m1. Installing Docker... \e[0m" && sleep 1
sudo apt update -y && sudo apt install apt-transport-https ca-certificates curl software-properties-common -y && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" && sudo apt install docker-ce

echo -e "\e[1m\e[32m2. Installing Essential package... \e[0m" && sleep 1
sudo apt-get install -y pkg-config curl git build-essential libssl-dev screen

echo -e "\e[1m\e[32m3. Cloning pathfinder... \e[0m" && sleep 1
git clone --branch v0.4.0 https://github.com/eqlabs/pathfinder.git

echo -e "\e[1m\e[32m4. Creating pathfinder folder... \e[0m" && sleep 1
mkdir -p $HOME/pathfinder

echo -e "\e[1m\e[32m5. Running Docker... \e[0m" && sleep 1
docker run -d \
  --rm \
  -p 9545:9545 \
  --user "$(id -u):$(id -g)" \
  -e RUST_LOG=info \
  --name starknet \
  -e PATHFINDER_ETHEREUM_API_URL="$ApiURL" \
  -v $HOME/pathfinder:/usr/share/pathfinder/data \
  eqlabs/pathfinder
