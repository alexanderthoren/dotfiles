#!/bin/sh

echo "Setting up LINUX-GNU"

# Install dependencies
echo "Installing dependencies"
sudo apt-get update
sudo apt-get upgrade

sudo apt-get install zsh

chsh -s $(which zsh)

# Check for Homebrew and install if we don't have it
if [[ $(command -v brew) == "" ]]; then
        echo "Installing Homebrew"
                /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
		echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/alexanderthoren/.zprofile
		eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
else
        echo "Hombrew already installed"
fi

# Update Homebrew
echo "Updating Homebrew"
brew update

# Upgrade Homebrew
echo "Upgrading Homebrew"
brew upgrade

# Create Pbcopy
echo "Creating Bbcopy"
mkdir $HOME/bin/
cp -f .files/pbcopy $HOME/bin/
chmod u+x $HOME/bin/pbcopy

# Copy files to different folders
echo "Copying files to $HOME"
cp -f .files/.gitconfig $HOME
cp -f .files/.zshrc $HOME

# Destination path
echo "Copying files"
#NVIM_PATH=$HOME/.config
