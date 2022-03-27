#!/bin/sh

LRED='\033[1;31m'
RESET='\033[0m' 

echo -e "${LRED}Updating astrovim${RESET}"
cd ~/.config/nvim && git pull

echo -e "${LRED}Updating custom config${RESET}"
cd ~/.config/nvim/lua/user && git pull
