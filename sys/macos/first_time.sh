#!/bin/sh

cp sys/shared/.home/.gitconfig ~

# Install nerd fonts
cp sys/shared/fonts/MesloLGS/MesloLGS\ NF\ Bold\ Italic.ttf ~/Library/Fonts
cp sys/shared/fonts/MesloLGS/MesloLGS\ NF\ Bold.ttf ~/Library/Fonts
cp sys/shared/fonts/MesloLGS/MesloLGS\ NF\ Italic.ttf ~/Library/Fonts
cp sys/shared/fonts/MesloLGS/MesloLGS\ NF\ Regular.ttf ~/Library/Fonts

# Install terminal plugins
brew install tmux
brew install starship
brew install nvim
brew install bat
brew install fzf
brew install ripgrep
brew install pre-commit
brew install node
brew install zoxide
brew install eza
brew install zsh-autosuggestions
brew install grex
brew install bartib
brew install xcode-build-server
brew install lazygit
brew install xcbeautify
brew install httpie
brew install silicon

# bash
brew install shellcheck

# lua
brew install lua
brew install stylua
brew install luarocks
luarocks install luacheck

# swift
brew install swiftlint
brew install swiftformat
brew install peripheryapp/periphery/periphery

# Install apps
brew install --no-quarantine alacritty
brew install ghostty
brew install arc
brew install raycast
brew install notion
brew install superlist
brew install monitorcontrol
brew install proxyman
brew install orbstack
brew install copilot-for-xcode
brew install --cask xcodes
brew install homerow

# Install system plugins
brew tap FelixKratz/formulae
brew install borders
brew install sketchybar
brew install nikitabobko/tap/aerospace

# Install nerd fonts script
# curl -fsSL https://raw.githubusercontent.com/getnf/getnf/main/install.sh | bash

# Install zip apps
# cp -r sys/macos/apps/SourceryPro.zip /Applications/
# tar -xf /Applications/SourceryPro.zip -C /Applications/
# rm /Applications/SourceryPro.zip

# Defaults configuration
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false
