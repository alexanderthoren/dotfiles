#!/bin/zsh

# 1. Copy this file from the dotfiles repo to your ~ (root)
# 2. run chmod -x basic_installation.sh
# 3. source basic_installation.sh

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

# TODO: copy macos files

# TODO: copy shared files

cd ~

# Install nerd fonts
brew tap homebrew/cask-fonts
brew install font-source-code-pro

# Install apps
brew install --no-quarantine alacritty

# Install terminal plugins
brew install starship
