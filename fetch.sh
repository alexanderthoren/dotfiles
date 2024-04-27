#!/bin/sh

dotfiles_dir="$(dirname "$0")"

# Copy macos home files
cp ~/.zshrc "$dotfiles_dir/sys/macos/.home"
cp ~/.zprofile "$dotfiles_dir/sys/macos/.home"
cp ~/.aerospace.toml "$dotfiles_dir/sys/macos/.home"
cp ~/.gitignore "$dotfiles_dir/sys/macos/.home"

# Copy macos ~/.config files
rm -r "$dotfiles_dir/sys/macos/.config/alacritty"
cp -r ~/.config/alacritty "$dotfiles_dir/sys/macos/.config"
rm -r "$dotfiles_dir/sys/macos/.config/sketchybar"
cp -r ~/.config/sketchybar "$dotfiles_dir/sys/macos/.config"
rm -r "$dotfiles_dir/sys/macos/.config/borders"
cp -r ~/.config/borders "$dotfiles_dir/sys/macos/.config"

# Copy shared home files
cp ~/.tmux.conf "$dotfiles_dir/sys/shared/.home"

# Copy shared ~/.config files
cp  ~/.config/starship.toml "$dotfiles_dir/sys/shared/.config"
rm -r "$dotfiles_dir/sys/shared/.config/lvim"
cp -r ~/.config/lvim "$dotfiles_dir/sys/shared/.config"
rm -r "$dotfiles_dir/sys/shared/.config/nvim"
cp -r ~/.config/nvim "$dotfiles_dir/sys/shared/.config"
