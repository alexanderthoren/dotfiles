#!/bin/sh

dotfiles_dir="$(dirname "$0")"

# Copy macos home files
cp "$dotfiles_dir/sys/macos/.home/.zprofile" ~
cp "$dotfiles_dir/sys/macos/.home/.zshrc" ~
cp "$dotfiles_dir/sys/macos/.home/.aerospace.toml" ~
cp "$dotfiles_dir/sys/macos/.home/.gitignore" ~

# Copy macos ~/.config files
alacrity_path=~/.config/alacritty
if [ -d "$alacrity_path" ]; then rm -rf "$alacrity_path"; fi
cp -r "$dotfiles_dir/sys/macos/.config/alacritty" ~/.config
sketchybar_path=~/.config/sketchybar
if [ -d $sketchybar_path ]; then rm -rf $sketchybar_path; fi
cp -r "$dotfiles_dir/sys/macos/.config/sketchybar" ~/.config
borders_path=~/.config/borders
if [ -d $borders_path ]; then rm -rf $borders_path; fi
cp -r "$dotfiles_dir/sys/macos/.config/borders" ~/.config

# Copy shared home files
cp "$dotfiles_dir/sys/shared/.home/.tmux.conf" ~

# Copy shared ~/.config files
cp "$dotfiles_dir/sys/shared/.config/starship.toml" ~/.config
lvim_path=~/.config/lvim
if [ -d "$lvim_path" ]; then rm -rf $lvim_path; fi
cp -r "$dotfiles_dir/sys/shared/.config/lvim" ~/.config
nvim_cache_path=~/.cache/nvim
if [ -d "$nvim_cache_path" ]; then rm -rf $nvim_cache_path; fi
nvim_local_share_path=~/.local/share/nvim/
if [ -d "$nvim_local_share_path" ]; then rm -rf $nvim_local_share_path; fi
nvim_path=~/.config/nvim
if [ -d "$nvim_path" ]; then rm -rf $nvim_path; fi
cp -r "$dotfiles_dir/sys/shared/.config/nvim" ~/.config
