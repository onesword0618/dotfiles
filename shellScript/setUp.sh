#!/bin/bash
#
# This Script make 'Symbolic Link'

# Author onesword0618

# Exection
FILES=(.profile .bash_profile .bashrc .bash_aliases .gitconfig .vimrc .zshrc )

for target in ${FILES[@]} do
    ln -s $HOME/dotfiles/$target $HOME/$target
done
