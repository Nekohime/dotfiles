#!/usr/bin/env bash

# shellcheck disable=SC1091

export DOTFILES="$HOME/.neko/"

#Exports
source "$DOTFILES/.exports"

source "$DOTFILES/.colours"

#Aliases
source "$DOTFILES/.aliases"

#Functions
source "$DOTFILES/.functions"

source /etc/profile.d/emscripten.sh
