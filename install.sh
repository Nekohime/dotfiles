#!/usr/bin/env bash

# Copies folders to $HOME
# Does not edit .bashrc

cp -rpuv .newsboat/ $HOME/
sudo cp .newsboat/newsboat_choice /usr/local/bin/

