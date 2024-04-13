#!/bin/sh

# 1. Copy this file from the dotfiles repo to your ~ (root)
# 2. run chmod -x full_installation.sh
# 3. source full_installation.sh

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/alexanderthoren/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install Github CLI
brew install gh
gh auth login

# Clone dotfiles
mkdir Developer
cd Developer
gh repo clone dotfiles
cd dotfiles

# Copy macos home files
cp sys/macos/.home/.zprofile ~
cp sys/macos/.home/.zshrc ~
cp sys/macos/.home/.aerospace.toml ~

# Copy macos ~/.config files
cp -r sys/macos/.config/alacritty ~/.config
cp -r sys/macos/.config/sketchybar ~/.config

# Copy shared home files
cp sys/shared/.home/.gitconfig ~
cp sys/shared/.home/.tmux.conf ~
cp sys/shared/.home/.tmuxsessions ~

# Copy shared ~/.config files
cp sys/shared/.config/starship.toml ~/.config
cp -r sys/shared/.config/nvim ~/.config

# Install nerd fonts
cp sys/shared/fonts/MesloLGS/MesloLGS\ NF\ Bold\ Italic.ttf ~/Library/Fonts
cp sys/shared/fonts/MesloLGS/MesloLGS\ NF\ Bold.ttf ~/Library/Fonts
cp sys/shared/fonts/MesloLGS/MesloLGS\ NF\ Italic.ttf ~/Library/Fonts
cp sys/shared/fonts/MesloLGS/MesloLGS\ NF\ Regular.ttf ~/Library/Fonts

# Install Xcode
brew install xcodes
xcodes install --latest

# Install terminal plugins
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

# Install zip apps
cp -r sys/macos/apps/Vimac.zip /Applications/
tar -xf /Applications/Vimac.zip -C /Applications/
rm /Applications/Vimac.zip
cp -r sys/macos/apps/SourceryPro.zip /Applications/
tar -xf /Applications/SourceryPro.zip -C /Applications/
rm /Applications/SourceryPro.zip

# Git Clone
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Defaults configuration
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false
