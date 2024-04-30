#!/bin/sh

# Copy home files
cp ~/.zshrc ./sys/shared/.home
cp ~/.gitignore ./sys/shared/.home

# Copy ~/.config files
rm -r ./sys/ubuntu/.config/alacritty
cp -r ~/.config/alacritty ./sys/ubuntu/.config

# Copy shared home files
cp ~/.tmux.conf ./sys/shared/.home

# Copy shared ~/.config files
cp  ~/.config/starship.toml ./sys/shared/.config
rm -r ./sys/shared/.config/nvim
cp -r ~/.config/nvim ./sys/shared/.config
