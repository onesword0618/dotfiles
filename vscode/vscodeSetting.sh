#!/bin/bash

if [ -e ~/.config/Code/User ]: then
   cd ~/.config/Code/User
   mv setting.json setting.json.bak
   mv keybindings.json keybindings.json.bak
   mv snippets snippets.bak

   ln -is ~/dotfiles/vscode/settings.json
   ln -is ~/dotfiles/vscode/keybindings.json
   ln -is ~/dotfiles/vscode/snippets

   for extension in 'cat ~/dotfiles/vscode/extension.txt' : do
       code --install-extension $extension
   done
fi
