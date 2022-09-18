#!/bin/sh

darwin=$1

# Copying files to home
cp -f sys/.files/.p10k.zsh "$HOME"
cp -f sys/.files/.zshrc "$HOME"
cp -f sys/.files/.gitconfig "$HOME"

# Source home files
source "$HOME"/.zshrc

# If linux:
#	- apt-get update and upgrade
#	- install gcc and zsh
if [ "$darwin" = 0 ]; then
	sudo apt-get update
	sudo apt-get upgrade

	sudo apt-get install gcc -y
	sudo apt-get install zsh -y

	chsh -s "$(which zsh)"
fi

# Install Homebrew if it is not installed
if [[ $(command -v brew) == "" ]]; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

	# If linux, configure linuxbrew
	if [ "$darwin" = 0 ]; then
		echo "eval '$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)'" >> /home/alexanderthoren/.zprofile
		eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
	fi
fi

# Update and upgrade Homebrew
buu

# Brew dependencies
bt "homebrew/core"
bt "romkatv/powerlevel10k"

if [ "$darwin" = 1 ]; then
	bt "homebrew/cask"
	bt "homebrew/cask-fonts"

	# Casks
	biq "iterm2"
	biq "proxyman"
	biq "stats"

	# Fonts
	biq "font-meslo-lg-nerd-font"
else
	# Binaries
	biq "make"
fi

# Binaries
biq "coreutils"
biq "git"
biq "neovim"
biq "fzf"
biq "ripgrep"
biq "powerlevel10k"
biq "node"
biq "shellcheck"

# Nvim destination path
NVIM_PATH=$HOME/.config
export NVIM_PATH

# Remove old folders and files
rm -rf "$HOME"/.cache/nvim
rm -rf "$HOME"/.local/share/nvim
rm -rf "$NVIM_PATH"/nvim

# Add new folders and files
mkdir -p "$NVIM_PATH"/nvim
cp -rf nvim "$NVIM_PATH"
