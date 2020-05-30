#!/bin/bash
#
# The Script make .bash_profile and .bashrc.

# Use Ubuntu
lsb_release -d -r

# Author onesword0618

# Exection
readonly bash_profile=.bash_profile
readonly bashrc=.bashrc

# 1. move home directory
cd ~
# 2. Create .bash_profile/.bashrc
if [ ! -e $bash_profile -a ! -e $bashrc ]; then
 touch .bash_profile && touch .bashrc
fi
# 3. Result check
ls -a
