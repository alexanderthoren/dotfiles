#!/bin/sh

echo "Brew installation"

# Install Homebrew if it is not installed
echo "Verifying if Homebrew is installed"
if [[ $(command -v brew) == "" ]]; then
	echo "Installing Homebrew"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Update and upgrade Homebrew
echo "Updating and upgrading Homebrew"
buu

# Brew dependencies
echo "Tap dependencies"
bt "homebrew/core"
bt "romkatv/powerlevel10k"
bt "homebrew/cask"
bt "homebrew/cask-fonts"

# Casks
echo "Installing casks"
biq "alacritty" --no-quarantine
biq "proxyman"
biq "stats"

# Binaries
echo "Installing binaries"
biq "coreutils"
biq "git"
biq "neovim"
biq "fzf"
biq "ripgrep"
biq "powerlevel10k"
biq "node"
biq "shellcheck"
biq "TheZoraiz/ascii-image-converter/ascii-image-converter"

echo "Brew installation completed!"
