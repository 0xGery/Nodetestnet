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

echo -e "\e[1m\e[32m1. Update System... \e[0m" && sleep 1
sudo apt update -y && sudo apt install apt-transport-https ca-certificates curl software-properties-common -y && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" && sudo apt install docker-ce

echo -e "\e[1m\e[32m2. Creating GPG docker KEY.... \e[0m" && sleep 1
sudo mkdir -p /etc/apt/keyrings && curl -fsSL https://download.docker.com/linux/ubuntu/gpg && sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo -e "\e[1m\e[32m3. Repository Set up.... \e[0m" && sleep 1
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo -e "\e[1m\e[32m4. Installing docker.... \e[0m" && sleep 1
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

echo -e "\e[1m\e[32m5. Download stader-cli.... \e[0m" && sleep 1
cd ~ && mkdir ~/bin && wget https://dub.sh/linuxamd64 -O ~/bin/stader-cli

