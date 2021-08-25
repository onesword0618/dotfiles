#!/bin/bash

#constants
DOTFILES="$(pwd)"
#color
GRAY="\033[1;38;5;243m"
BULE="\033[1;34m"
GREEN="\033[1;32m"
PURPLE="\033[1;35m"
NONE="\033[0m"

title() {
 echo "${PURPLE}$1${NONE}"
 echo "${GRAY}==============${NONE}"
}


setup() {
 title "call setup function"
}

for I in 1; do
 setup
done
