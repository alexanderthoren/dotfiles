#!/bin/zsh

# This file only adds the latest changes of your system to your dotfiles

# Copy macos home files
cp ~/.zshrc sys/macos/.home
cp ~/.zprofile sys/macos/.home

# Copy macos ~/.config files
cp -r ~/.config/alacritty sys/macos/.config

# Copy shared home files
cp ~/.tmux.conf sys/shared/.home
cp ~/.tmuxsessions sys/shared/.home

# Copy shared ~/.config files
#cp sys/shared/.config/starship.toml ~/.config
cp -r ~/.config/nvim sys/shared/.config
