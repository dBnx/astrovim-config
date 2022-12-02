#!/bin/sh

BASEDIR="$HOME/.config/nvim/spell"
mkdir "$BASEDIR" || exit
cd "$BASEDIR"
wget "https://github.com/vim/vim/raw/master/runtime/spell/en.utf-8.spl" 
wget "https://github.com/vim/vim/raw/master/runtime/spell/de.utf-8.spl" 
