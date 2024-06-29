#!/bin/sh

dotfiles_dir="$(dirname "$0")"

# Copy ubuntu home files
cp -r ~/.xsessionrc "$dotfiles_dir/.home"
cp -r ~/.screenlayout "$dotfiles_dir/.home"

# Copy ubuntu ~/.config files
rm -r "$dotfiles_dir/.config/alacritty"
cp -r ~/.config/alacritty "$dotfiles_dir/.config"
rm -r "$dotfiles_dir/.config/bspwm"
cp -r ~/.config/bspwm "$dotfiles_dir/.config"
rm -r "$dotfiles_dir/.config/sxhkd"
cp -r ~/.config/sxhkd "$dotfiles_dir/.config"
rm -r "$dotfiles_dir/.config/rofi"
cp -r ~/.config/rofi "$dotfiles_dir/.config"

# Copy shared home files
cp ~/.tmux.conf "$dotfiles_dir/../shared/.home"
cp ~/.tmuxtheme.conf "$dotfiles_dir/../shared/.home"
cp ~/.zshrc "$dotfiles_dir/../shared/.home"
cp ~/.gitignore "$dotfiles_dir/../shared/.home"

# Copy shared ~/.config files
cp  ~/.config/starship.toml "$dotfiles_dir/../shared/.config"
rm -r "$dotfiles_dir/../shared/.config/nvim"
mkdir "$dotfiles_dir/../shared/.config/nvim"
cp -r ~/.config/nvim/lua "$dotfiles_dir/../shared/.config/nvim/lua"
cp ~/.config/nvim/init.lua "$dotfiles_dir/../shared/.config/nvim"
cp ~/.config/nvim/lazy-lock.json "$dotfiles_dir/../shared/.config/nvim"
cp ~/.config/nvim/.luacheckrc "$dotfiles_dir/../../"
cp ~/.config/nvim/.stylua.toml "$dotfiles_dir/../../"
