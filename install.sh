#!/bin/sh

echo "Setting up..."

if [ "$(uname)" == "Darwin" ]; then
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
#elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
#elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
#elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
fi

if [ "$(uname)" == "Darwin" ]; then
	# Copy files to different folders
	echo "Copying files to $HOME"
	cp -f .files/.p10k.zsh $HOME
	cp -f .files/zshrc $HOME

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

	# Link new folder
	echo "Linking Neovim folder to this repository"
	stow --restow --target=$NVIM_PATH/nvim .
#elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
#elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
	NVIM_PATH=$HOME/AppData/Local/nvim
	rm -rf $HOME/AppData/Local/nvim-data/site
	mkdir $NVIM_PATH
	cp -rf init.lua $NVIM_PATH
	cp -rf after $NVIM_PATH
	cp -rf lua $NVIM_PATH
fi

# Close the terminal
echo "Installation completed!"
#exit
