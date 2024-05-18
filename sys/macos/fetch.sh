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
cp ~/.tmuxtheme.conf "$dotfiles_dir/../shared/.home"
cp ~/.zshrc "$dotfiles_dir/../shared/.home"
cp ~/.gitignore "$dotfiles_dir/../shared/.home"

# Copy shared ~/.config files
cp ~/.config/starship.toml "$dotfiles_dir/../shared/.config"
rm -r "$dotfiles_dir/../shared/.config/nvim"
mkdir "$dotfiles_dir/../shared/.config/nvim"
cp -r ~/.config/nvim/lua "$dotfiles_dir/../shared/.config/nvim/lua"
cp ~/.config/nvim/init.lua "$dotfiles_dir/../shared/.config/nvim"
cp ~/.config/nvim/lazy-lock.json "$dotfiles_dir/../shared/.config/nvim"
cp ~/.config/nvim/.luacheckrc "$dotfiles_dir/../../"
cp ~/.config/nvim/.stylua.toml "$dotfiles_dir/../../"
