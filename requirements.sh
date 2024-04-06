#!/usr/bin/env bash

# newsboat setup

# Requires npm & node, out of scope for this requirement installer
npm -g install readability-cli

# Assuming Arch, may look into cross-distro solution later.
sudo pacman -S newsboat dialog tree jpegoptim oxipng pkgfile bash-completion wl-clipboard whois fluidsynth soundfont-fluid

