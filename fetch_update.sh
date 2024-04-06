#!/bin/zsh

# This file only adds the latest changes of your dotfiles to your system

# Copy macos home files
cp sys/macos/.home/.zprofile ~
cp sys/macos/.home/.zshrc ~

# Copy macos ~/.config files
cp -r sys/macos/.config/alacritty ~/.config

# Copy shared home files
cp sys/shared/.home/.tmux.conf ~

# Copy shared ~/.config files
cp sys/shared/.config/starship.toml ~/.config
#rm -rf ~/.cache/nvim
#rm -rf ~/.local/share/nvim
cp -r sys/shared/.config/nvim ~/.config
