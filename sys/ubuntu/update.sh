#!/bin/sh

dotfiles_dir="$(dirname "$0")"

# Copy ubuntu home files

# Copy ubuntu ~/.config files
alacrity_path=~/.config/alacritty
if [ -d "$alacrity_path" ]; then rm -rf "$alacrity_path"; fi
cp -r "$dotfiles_dir/.config/alacritty" ~/.config

# Copy shared home files
cp "$dotfiles_dir/../shared/.home/.tmux.conf" ~
cp "$dotfiles_dir/../shared/.tmuxtheme.conf" ~
cp "$dotfiles_dir/../shared/.home/.zshrc" ~
cp "$dotfiles_dir/../shared/.home/.gitignore" ~

# Copy shared ~/.config files
cp "$dotfiles_dir/../shared/.config/starship.toml" ~/.config
nvim_cache_path=~/.cache/nvim
if [ -d "$nvim_cache_path" ]; then rm -rf $nvim_cache_path; fi
nvim_local_share_path=~/.local/share/nvim/
if [ -d "$nvim_local_share_path" ]; then rm -rf $nvim_local_share_path; fi
nvim_path=~/.config/nvim
if [ -d "$nvim_path" ]; then rm -rf $nvim_path; fi
cp -r "$dotfiles_dir/../shared/.config/nvim" ~/.config
