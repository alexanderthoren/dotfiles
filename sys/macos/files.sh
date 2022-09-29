#!/bin/sh

echo "Installing  files"

# Copying files to home
dotfiles_path=sys/.files/
cp -f "$dotfiles_path".p10k.zsh "$HOME"
cp -f "$dotfiles_path".zshrc "$HOME"

# Source home files
source "$HOME"/.zshrc

# Config path
config_path=$HOME/.config/
mkdir -p "$config_path"

# Alacritty config
cp -rf sys/macos/alacritty "$config_path"

# Remove old folders and files
rm -rf "$HOME"/.cache/nvim
rm -rf "$HOME"/.local/share/nvim

# Add new folders and files
cp -rf nvim "$config_path"

echo "Files installation completed!"
