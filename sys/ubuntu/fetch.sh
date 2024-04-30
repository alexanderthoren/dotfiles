#!/bin/sh

dotfiles_dir="$(dirname "$0")"

# Copy home files
cp ~/.zshrc "$dotfiles_dir/sys/ubuntu/.home"
cp ~/.zprofile "$dotfiles_dir/sys/ubuntu/.home"
cp ~/.gitignore "$dotfiles_dir/sys/ubuntu/.home"

# Copy ~/.config files
rm -r "$dotfiles_dir/sys/ubuntu/.config/alacritty"
cp -r ~/.config/alacritty "$dotfiles_dir/sys/ubuntu/.config"

# Copy shared home files
cp ~/.tmux.conf "$dotfiles_dir/sys/shared/.home"

# Copy shared ~/.config files
cp  ~/.config/starship.toml "$dotfiles_dir/sys/shared/.config"
rm -r "$dotfiles_dir/sys/shared/.config/nvim"
cp -r ~/.config/nvim "$dotfiles_dir/sys/shared/.config"
