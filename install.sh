#!/bin/bash

# constants
DOTFILES="$(pwd)"
# color
NONE="\033[0m"
GRAY="\033[1;38;5;243m"
PURPLE="\033[1;35m"
RED="\033[1;31m"
BLUE="\033[1;34m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"

title() {
 echo "${PURPLE}$1${NONE}"
 echo "${GRAY}>>>>>>>>>>>>>>>>>>>>>>>>>${NONE}"
}

information() {
 echo "${BLUE}Information: ${NONE}$1"
}

warning() {
 echo "${YELLOW}Warning: ${NONE}$1"
}

error() {
 echo "${RED}Error: ${NONE}$1"
}

success() {
 echo "${GREEN}$1${NONE}"
}

symlinks() {
 title "Creating Symlinks."

 information "Creating .bashrc."
 bashrc=${DOTFILES}/.bashrc
 if [ ! -e "$HOME/.bashrc" ]; then
   information "Adding symlink to bashrc at $HOME/.bashrc."
   ln -s "$bashrc" ~/.bashrc
 else
   warning "~/.bashrc already exits... Skip !!!"
 fi

 information "Creating .bash_profile."
 bash_profile=${DOTFILES}/.bash_profile
 if [ ! -e "$HOME/.bash_profile" ]; then
   information "Adding symlink to bash_profile at $HOME/.bash_profile."
   ln -s "$bash_profile" ~/.bash_profile
 else
   warning "~/.bash_profile already exits... Skip !!!"
 fi

 information "Creating .bash_aliases."
 bash_aliases=${DOTFILES}/.bash_aliases
 if [ ! -e "$HOME/.bash_aliases" ]; then
   information "Adding symlink to bash_aliases at $HOME/.bash_aliases."
   ln -s "$bash_aliases" ~/.bash_aliases
 else
   warning "~/.bash_aliases already exits... Skip !!!"
 fi
}

setup() {
 title "Call Setup Function"
 symlinks
}

# Main Process.
for I in 1; do
 setup
done
