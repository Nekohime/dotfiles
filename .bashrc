#!/usr/bin/env bash

# Check if running interactively, if not, exit
case $- in
    *i*) ;;
    *) return;;
esac

if [ ! -f /etc/debian_version ]; then
  # Doesn't work on debian-based distros
  # TODO: Investigate other distros?
  export LANG="en_CA.UTF-8"
  export LC_ALL="en_CA.UTF-8"

  # Source command-not-found script for better error messages
  # systemctl enable pkgfile-update.timer
  # pkgfile -u
  source "/usr/share/doc/pkgfile/command-not-found.bash"
fi

# Ignore duplicate and leading-space lines in history
HISTCONTROL=ignoreboth

# Append to the history file instead of overwriting it
shopt -s histappend

# Set maximum size for command history
HISTSIZE=1024
HISTFILESIZE=2048

# Update LINES and COLUMNS after each command if necessary
shopt -s checkwinsize

# Function to update terminal title
update_term_title() {
    TERM_TITLE="$USER@$HOSTNAME:$(basename "$PWD") : $(basename "$SHELL")"
    echo -ne "\033]30;$TERM_TITLE\007"
}

# Enable color prompt if the terminal supports it
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# Set PS1 (the prompt) with or without color, based on color_prompt variable
if [ "$color_prompt" = yes ]; then
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='\u@\h:\w\$ '
fi
unset color_prompt

# Set terminal title if it's xterm
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;\u@\h: \w\a\]$PS1"
        update_term_title
        ;;
    *)
        ;;
esac

PROMPT_COMMAND=update_term_title

# Define a function for alerting long-running commands
alert() {
    # Get the exit code of the previous command
    local exit_code=$?

    # Extract the last command from the history and remove any trailing 'alert' command
    local message
    message="$(history | tail -n1 | \
        sed -e 's/^\s*[0-9]\+\s*//' \
            -e 's/[;&|]\s*alert$//')"

    # Set the default icon to 'terminal'
    local icon="terminal"

    # Check if the exit code is non-zero (indicating an error) and change the icon accordingly
    if [ $exit_code -ne 0 ]; then
        icon="error"
    fi

    # Display a desktop notification with the specified urgency, icon, and message
    notify-send --urgency=low -i "$icon" "$message"
}

# Source user-specific alias configurations if they exist
if [ -f "$HOME/.bash_aliases" ]; then
    source "$HOME/.bash_aliases"
fi

# Enable programmable completion features
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        source /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        source /etc/bash_completion
    fi
fi


# Source custom configs https://github.com/Nekohime/dotfiles
export DOTFILES="$HOME/.neko/"

# Exports
source "$DOTFILES/.exports"

source "$DOTFILES/.colours"

# Aliases
source "$DOTFILES/.aliases"

# Functions
source "$DOTFILES/.functions"
