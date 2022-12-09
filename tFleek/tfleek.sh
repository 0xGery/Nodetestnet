echo "+++++++++++++++++++++++++++++++++++++++++++++++++++"
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
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++"

sleep 2

echo -e "\e[1m\e[32m1. Installing Dependencies... \e[0m" && sleep 1
sudo apt-get install screen wget
sudo apt-get update && apt-get upgrade && sudo apt-get install build-essential cmake curl protobuf-compiler clang pkg-config libssl-dev git ca-certificates gnupg lsb-release -y && sudo mkdir -p /etc/apt/keyrings && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update && sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
cargo install sccache

echo -e "\e[1m\e[32m2. Installing URSA... \e[0m" && sleep 1
git clone https://github.com/fleek-network/ursa.git && cd ursa && rm Makefile
wget -q https://raw.githubusercontent.com/scryotic-tech/Nodetestnet/main/tFleek/Makefile && make install
export DOCKER_BUILDKIT=1 && make docker-build

echo -e "\e[1m\e[32m3. Running URSA-Docker... \e[0m" && sleep 1
make docker-run

