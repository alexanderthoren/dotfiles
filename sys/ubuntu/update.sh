#!/bin/sh

# Copy home files
cp ./sys/shared/.home/.zshrc ~
cp ./sys/shared/.home/.gitignore ~

# Copy ~/.config files
alacrity_path=~/.config/alacritty
if [ -d "$alacrity_path" ]; then rm -rf "$alacrity_path"; fi
cp -r ./sys/ubuntu/.config/alacritty ~/.config

# Copy shared home files
cp ./sys/shared/.home/.tmux.conf ~

# Copy shared ~/.config files
cp ./sys/shared/.config/starship.toml ~/.config
nvim_cache_path=~/.cache/nvim
if [ -d "$nvim_cache_path" ]; then rm -rf $nvim_cache_path; fi
nvim_local_share_path=~/.local/share/nvim/
if [ -d "$nvim_local_share_path" ]; then rm -rf $nvim_local_share_path; fi
nvim_path=~/.config/nvim
if [ -d "$nvim_path" ]; then rm -rf $nvim_path; fi
cp -r ./sys/shared/.config/nvim ~/.config
