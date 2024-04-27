#!/bin/sh

# Copy macos home files
cp ~/.zshrc sys/macos/.home
cp ~/.zprofile sys/macos/.home
cp ~/.aerospace.toml sys/macos/.home
cp ~/.gitignore sys/macos/.home

# Copy macos ~/.config files
rm -r sys/macos/.config/alacritty
cp -r ~/.config/alacritty sys/macos/.config
rm -r sys/macos/.config/sketchybar
cp -r ~/.config/sketchybar sys/macos/.config
rm -r sys/macos/.config/borders
cp -r ~/.config/borders sys/macos/.config

# Copy shared home files
cp ~/.tmux.conf sys/shared/.home

# Copy shared ~/.config files
cp  ~/.config/starship.toml sys/shared/.config
rm -r sys/shared/.config/lvim
cp -r ~/.config/lvim sys/shared/.config
rm -r sys/shared/.config/nvim
cp -r ~/.config/nvim sys/shared/.config
