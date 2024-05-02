#!/bin/sh

dotfiles_dir="$(dirname "$0")"

# Copy ubuntu home files

# Copy ubuntu ~/.config files
rm -r "$dotfiles_dir/.config/alacritty"
cp -r ~/.config/alacritty "$dotfiles_dir/.config"

# Copy shared home files
cp ~/.tmux.conf "$dotfiles_dir/../shared/.home"
cp ~/.tmuxtheme.conf "$dotfiles_dir/../shared/.home"
cp ~/.zshrc "$dotfiles_dir/../shared/.home"
cp ~/.gitignore "$dotfiles_dir/../shared/.home"

# Copy shared ~/.config files
cp  ~/.config/starship.toml "$dotfiles_dir/../shared/.config"
rm -r "$dotfiles_dir/../shared/.config/nvim"
cp -r ~/.config/nvim "$dotfiles_dir/../shared/.config"
