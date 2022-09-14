#!/bin/sh

echo "Setting up LINUX-GNU"

# Install dependencies
echo "Installing dependencies"
sudo apt-get update
sudo apt-get upgrade

sudo apt-get install gcc -y
sudo apt-get install zsh -y

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

# Install all dependencies with eundle
brew tap homebrew/bundle
brew bundle --file linux/Brewfile

# Copy files to different folders
echo "Copying files to $HOME"
cp -f linux/.p10k.zsh $HOME
cp -f .files/.zshrc $HOME
cp -f .files/.gitconfig $HOME

# Destination path
echo "Copying files"
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
