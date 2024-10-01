#!/bin/bash
version="0.1"

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

checkFolder () {
  if [ -d "$1" ]
  then
    echo -e "Directory ${GREEN}$1${NC} exists."
  else
    echo -e "Creating ${GREEN}$1${NC} folder"
    mkdir $1
  fi 
}

echo -e "${PURPLE} _____    ______   _    _   ______   _    _  10${NC}";
echo -e "${PURPLE}| | \ \  / |  | \ | |  | | | | ____ | |  | |   ${NC}";
echo -e "${PURPLE}| |  | | | |  | | | |  | | | |  | | | |--| |   ${NC}";
echo -e "${PURPLE}|_|_/_/  \_|__|_/ \_|__|_| |_|__|_| |_|  |_|   ${NC}";
echo -e "${WHITE}Clock Installer v:${NC}${GREEN}${version}${NC}";
echo -e "${PURPLE}                                               ${NC}";
echo -e "${YELLOW}Install Python3 & PIP${NC}"
sudo apt install python3 python3-pip -y
echo -e "${GREEN}Python3 & PIP Installed${NC}"


echo -e "${YELLOW}Setup virtual enviroment${NC}"
python3 -m venv ~/.venv
echo -e "${GREEN}~/.venv created${NC}"


echo -e "${YELLOW}Installing python art module${NC}"
~/.venv/bin/python3 -m pip install art
echo -e "${GREEN}art module Installed${NC}"


echo -e "${YELLOW}Adding clock command to ~/.bashrc${NC}"
echo '~/.venv/bin/python3 ~/clock/clock.py' >> ~/.bashrc
echo -e "${GREEN}Clock command added to ~/.bashrc${NC}"
