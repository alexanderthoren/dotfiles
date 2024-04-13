#!/bin/sh

# This file only adds the latest changes of your dotfiles to your system

# Copy macos home files
cp sys/macos/.home/.zprofile ~
cp sys/macos/.home/.zshrc ~
cp sys/macos/.home/.aerospace.toml ~

# Copy macos ~/.config files
rm -r ~/.config/alacritty
cp -r sys/macos/.config/alacritty ~/.config
rm -r ~/.config/sketchybar
cp -r sys/macos/.config/sketchybar ~/.config

# Copy shared home files
cp sys/shared/.home/.tmux.conf ~
cp sys/shared/.home/.tmuxsessions ~

# Copy shared ~/.config files
cp sys/shared/.config/starship.toml ~/.config
rm -rf ~/.cache/nvim
rm -rf ~/.local/share/nvim
rm -r ~/.config/nvim
cp -r sys/shared/.config/nvim ~/.config
