#!/bin/sh

dotfiles_dir="$(dirname "$0")"

# Copy macos home files
cp "$dotfiles_dir/.home/.aerospace.toml" ~

# Copy macos ~/.config files
ghostty_path=~/.config/ghostty
if [ -d "$ghostty_path" ]; then rm -rf "$ghostty_path"; fi
cp -r "$dotfiles_dir/.config/ghostty" ~/.config
alacrity_path=~/.config/alacritty
if [ -d "$alacrity_path" ]; then rm -rf "$alacrity_path"; fi
cp -r "$dotfiles_dir/.config/alacritty" ~/.config
sketchybar_path=~/.config/sketchybar
if [ -d $sketchybar_path ]; then rm -rf $sketchybar_path; fi
cp -r "$dotfiles_dir/.config/sketchybar" ~/.config
borders_path=~/.config/borders
if [ -d $borders_path ]; then rm -rf $borders_path; fi
cp -r "$dotfiles_dir/.config/borders" ~/.config

# Copy shared home files
cp "$dotfiles_dir/../shared/.home/.tmux.conf" ~
cp "$dotfiles_dir/../shared/.home/.tmuxtheme.conf" ~
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
cp "$dotfiles_dir/../../.luacheckrc" $nvim_path
cp "$dotfiles_dir/../../.stylua.toml" $nvim_path
