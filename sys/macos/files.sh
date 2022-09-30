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

# Installing fonts

fonts_path=sys/fonts/
cp "$fonts_path"MesloLGS\ NF\ Bold\ Italic.ttf ~/Library/Fonts/
cp "$fonts_path"MesloLGS\ NF\ Bold.ttf ~/Library/Fonts/
cp "$fonts_path"MesloLGS\ NF\ Italic.ttf ~/Library/Fonts/
cp "$fonts_path"MesloLGS\ NF\ Regular.ttf ~/Library/Fonts/

echo "Files installation completed!"
