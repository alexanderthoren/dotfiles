#!/bin/sh

echo "Setting up Darwin"

# Check for Homebrew and install if we don't have it
if [[ $(command -v brew) == "" ]]; then
	echo "Installing Homebrew"
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
	echo "Hombrew already installed"
fi

# Update Homebrew  
echo "Updating Homebrew"
brew update

# Upgrade Homebrew
echo "Upgrading Homebrew"
brew upgrade

# Install all our dependencies with bundle (See Brewfile)
echo "Installing dependencies"
brew tap homebrew/bundle
brew bundle

# Updated Mac App Store applications
mas upgrade

# Copy files to different folders
echo "Copying files to $HOME"
cp -f .files/.p10k.zsh $HOME
cp -f .files/.zshrc $HOME
cp -f .files/.gitconfig $HOME

# Neovim config
NVIM_PATH=$HOME/.config
export NVIM_PATH

# Remove old folders and files
echo "Removing old Neovim folders"
rm -rf $HOME/.cache/nvim
rm -rf $HOME/.local/share/nvim
rm -rf $NVIM_PATH/nvim

# Add new folders and files
echo "Creating Neovim folder"
mkdir -p $NVIM_PATH/nvim
cp -rf nvim $NVIM_PATH
