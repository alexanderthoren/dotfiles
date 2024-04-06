#!/bin/zsh

# This file only adds the latest changes of your dotfiles to your system

# Copy macos home files

# Copy macos ~/.config files
cp sys/macos/.config/alacritty ~/.config

# Copy shared home files
cp sys/shared/.home/.tmux.conf ~

# Copy shared ~/.config files
cp sys/shared/.config/starship.toml ~/.config
rm -r ~/.cache/nvim
rm -r ~/.local/share/nvim
cp -r sys/shared/.config/nvim ~/.config
