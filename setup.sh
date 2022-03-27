#!/bin/sh

LRED='\033[1;31m'
RESET='\033[0m' 

# TODO: Check if exists
echo -e "${LRED}Backing up old nvim config${RESET}"
mv ~/.config/nvim ~/.config/nvim.backup

echo -e "${LRED}Installing astrovim${RESET}"
git clone https://github.com/kabinspace/AstroVim ~/.config/nvim

echo -e "${LRED}Installing custom config${RESET}"
git clone https://github.com/dBnx/astrovim-config.git ~/.config/nvim/lua/user

echo -e "${LRED}Starting vim & installing plugins${RESET}"
nvim +PackerSync

