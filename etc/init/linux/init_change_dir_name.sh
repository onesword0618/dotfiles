#!/bin/bash
#
# Changing Language japanese directory -> english directory

# Use Ubuntu
lsb_release -d -r

# Author onesword0618

# Exection
# 1. move home directory
cd ~
# 2. display
cat .config/user-dirs.dirs

# 3. changing
env LANGUAGE=C LC_MESSAGES=C xdg-user-dirs-gtk-update
# Check Environment List
env
