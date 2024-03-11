#!/usr/bin/env bash

# Copies folders to $HOME
# Then symlinks my bashrc to the one in $HOME

TMP_START=$(pwd)
cd $HOME/
ln -s $HOME/.neko/.bashrc .
cd "$TMP_START"
sudo cp .newsboat/newsboat_choice /usr/local/bin/
