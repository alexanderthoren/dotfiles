#!/bin/sh

echo "Setting up MINGW64_NT"

echo "Installing choco dependencies"
# Install dependencies with choco
choco install microsoft-windows-terminal
choco install neovim
choco install postman

echo "Copying files"
# Destination path
NVIM_PATH=$HOME/AppData/Local/nvim

# Remove old directories
rm -rf $NVIM_PATH
rm -rf $HOME/AppData/Local/nvim-data/site

# Copy nvim directory to destination path
cp -rf ./nvim $NVIM_PATH
cp -rf .files/.gitconfig $HOME

echo "Instaling Windows Subsystem for Linux"
wsl --install
