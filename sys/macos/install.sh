#!/bin/sh

# Copying files to home
echo "Copying .files"
dotfiles_path=sys/.files/
cp -f "$dotfiles_path".p10k.zsh "$HOME"
cp -f "$dotfiles_path".zshrc "$HOME"

# Source home files
echo "Sourcing home files"
source "$HOME"/.zshrc

# Config path
config_path=$HOME/.config/
mkdir -p "$config_path"

# Alacritty config
echo "Configuring Alacritty"
cp -rf sys/macos/alacritty "$config_path"

# Remove old folders and files
echo "Removing old nvim folders"
rm -rf "$HOME"/.cache/nvim
rm -rf "$HOME"/.local/share/nvim

# Add new folders and files
echo "Copying new nvim folders"
cp -rf nvim "$config_path"

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
