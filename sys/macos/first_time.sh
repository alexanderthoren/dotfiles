#!/bin/sh

cp sys/shared/.home/.gitconfig ~

# Install nerd fonts
cp sys/shared/fonts/MesloLGS/MesloLGS\ NF\ Bold\ Italic.ttf ~/Library/Fonts
cp sys/shared/fonts/MesloLGS/MesloLGS\ NF\ Bold.ttf ~/Library/Fonts
cp sys/shared/fonts/MesloLGS/MesloLGS\ NF\ Italic.ttf ~/Library/Fonts
cp sys/shared/fonts/MesloLGS/MesloLGS\ NF\ Regular.ttf ~/Library/Fonts

fetch_and_update

# Install Xcode
brew install xcodes
xcodes install --latest

# Install terminal plugins
brew install tree
brew install tmux
brew install starship
brew install nvim
brew install bat
brew install fzf
brew install ripgrep
brew install pre-commit
brew install sourcery
brew install peripheryapp/periphery/periphery
brew install node
brew install zoxide
brew install eza
brew install zsh-autosuggestions
brew install grex
brew install thefuck
brew install shellcheck
brew install slides
brew install bartib
brew install xcode-build-server
brew install lazygit
brew install xcbeautify
brew install httpie
brew install lua
brew install swiftlint
brew install swiftformat

# Install apps
brew install --no-quarantine alacritty
brew install raycast
brew install notion
brew install superlist
brew install monitorcontrol
brew install postman
brew install proxyman
brew install linear-linear

# Install system plugins
brew tap FelixKratz/formulae
brew install borders
brew install sketchybar
brew install nikitabobko/tap/aerospace

# Install npm packages
curl -fsSL https://bun.sh/install | bash
npm i -g carbon-now-cli

# Install nerd fonts script
curl -fsSL https://raw.githubusercontent.com/getnf/getnf/main/install.sh | bash

# Install zip apps
cp -r sys/macos/apps/Vimac.zip /Applications/
tar -xf /Applications/Vimac.zip -C /Applications/
rm /Applications/Vimac.zip
cp -r sys/macos/apps/SourceryPro.zip /Applications/
tar -xf /Applications/SourceryPro.zip -C /Applications/
rm /Applications/SourceryPro.zip

# Defaults configuration
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false
