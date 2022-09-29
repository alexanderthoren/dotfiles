#!/bin/sh

# Copying files to home
echo "Copying .files"
cp -f sys/.files/.p10k.zsh "$HOME"
cp -f sys/.files/.zshrc "$HOME"

alacritty_path=$HOME/.config/alacritty/
mkdir -p "$alacritty_path"
cp -f sys/macos/alacritty.yml "$alacritty_path"

# Source home files
echo "Sourcing home files"
source "$HOME"/.zshrc

# Nvim destination path
echo "Removing old Neovim folders"
NVIM_PATH=$HOME/.config
export NVIM_PATH

# Remove old folders and files
rm -rf "$HOME"/.cache/nvim
rm -rf "$HOME"/.local/share/nvim
rm -rf "$NVIM_PATH"/nvim

# Add new folders and files
echo "Copying new Neovim folders"
mkdir -p "$NVIM_PATH"/nvim
cp -rf nvim "$NVIM_PATH"

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
