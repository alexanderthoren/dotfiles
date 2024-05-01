#!/bin/sh

dotfiles_dir="$(dirname "$0")"

# Copy macos home files
cp ~/.aerospace.toml "$dotfiles_dir/.home"

# Copy macos ~/.config files
rm -r "$dotfiles_dir/.config/alacritty"
cp -r ~/.config/alacritty "$dotfiles_dir/.config"
rm -r "$dotfiles_dir/.config/sketchybar"
cp -r ~/.config/sketchybar "$dotfiles_dir/.config"
rm -r "$dotfiles_dir/.config/borders"
cp -r ~/.config/borders "$dotfiles_dir/.config"

# Copy shared home files
cp ~/.tmux.conf "$dotfiles_dir/../shared/.home"
cp ~/.zshrc "$dotfiles_dir/../shared/.home"
cp ~/.gitignore "$dotfiles_dir/../shared/.home"

# Copy shared ~/.config files
cp  ~/.config/starship.toml "$dotfiles_dir/../shared/.config"
rm -r "$dotfiles_dir/../shared/.config/nvim"
cp -r ~/.config/nvim "$dotfiles_dir/../shared/.config"
