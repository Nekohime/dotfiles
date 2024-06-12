#!/usr/bin/env bash

# newsboat setup

# Requires npm & node, out of scope for this requirement installer
command -v npm >/dev/null 2>&1 && npm -g install readability-cli || echo "NPM is not installed. Use NVM to install NPM. Skipping."

# Assuming Arch, may look into cross-distro solution later.
sudo pacman -S newsboat dialog tree jpegoptim oxipng pkgfile bash-completion wl-clipboard whois fluidsynth soundfont-fluid

