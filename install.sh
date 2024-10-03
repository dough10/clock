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

echo "${PURPLE} _____    ______   _    _   ______   _    _  10${NC}";
echo "${PURPLE}| | \ \  / |  | \ | |  | | | | ____ | |  | |   ${NC}";
echo "${PURPLE}| |  | | | |  | | | |  | | | |  | | | |--| |   ${NC}";
echo "${PURPLE}|_|_/_/  \_|__|_/ \_|__|_| |_|__|_| |_|  |_|   ${NC}";
echo "${WHITE}Clock Installer v:${NC}${GREEN}${version}${NC}";
echo ""

echo "${YELLOW}Install Python3 & PIP${NC}"
sudo apt update && sudo apt install python3 python3-pip python3.12-venv -y
echo "${GREEN}Python3 & PIP Installed${NC}"


echo "${YELLOW}Setup virtual enviroment${NC}"
python3 -m venv ~/.venv
echo "${GREEN}~/.venv created${NC}"


echo "${YELLOW}Installing python modules${NC}"
~/.venv/bin/python3 -m pip install -r requirments.txt
echo "${GREEN}Python modules Installed${NC}"


echo "${YELLOW}Adding clock command to ~/.bashrc${NC}"
echo '~/.venv/bin/python3 ~/clock/clock.py' >> ~/.bashrc
echo "${GREEN}Clock command added to ~/.bashrc${NC}"
