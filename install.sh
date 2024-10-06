#!/bin/bash
set -e
version="0.2"

BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
GREY='\033[0;37m'
YELLOW='\033[1;33m'
WHITE='\033[1;37m'
NC='\033[0m'

echo -e "${PURPLE} _____    ______   _    _   ______   _    _  10${NC}";
echo -e "${PURPLE}| | \ \  / |  | \ | |  | | | | ____ | |  | |   ${NC}";
echo -e "${PURPLE}| |  | | | |  | | | |  | | | |  | | | |--| |   ${NC}";
echo -e "${PURPLE}|_|_/_/  \_|__|_/ \_|__|_| |_|__|_| |_|  |_|   ${NC}";
echo -e "${WHITE}Clock Installer v:${NC}${GREEN}${version}${NC}";
echo -e ""

echo -e "${YELLOW}Install Dependencies${NC}"
sudo apt update && sudo apt install git python3 python3-pip -y
echo -e "${GREEN}Dependencies Installed${NC}"

echo -e "${YELLOW}Clone Github repo${NC}"
git clone https://github.com/dough10/clock
echo -e "${GREEN}Github repo cloned${NC}"

echo -e "${YELLOW}Setup virtual enviroment${NC}"
python3 -m venv ~/clock/.venv
echo -e "${GREEN}~/clock/.venv created${NC}"


echo -e "${YELLOW}Installing python modules${NC}"
~/clock/.venv/bin/python3 -m pip install -r ~/clock/requirments.txt
echo -e "${GREEN}Python modules Installed${NC}"


echo -e "${YELLOW}Adding clock command to ~/.bashrc${NC}"
echo -e '~/clock/.venv/bin/python3 ~/clock/clock.py' >> ~/.bashrc
echo -e "${GREEN}Clock command added to ~/.bashrc${NC}"

echo -e "${GREEN}Install complete${NC}"