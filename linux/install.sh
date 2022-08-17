#!/bin/sh

echo "Setting up LINUX-GNU"

# Install dependencies
echo "Installing dependencies"

# Copy files to different folders
echo "Copying files to $HOME"
cp -f .files/.gitconfig $HOME

# Destination path
echo "Copying files"
#NVIM_PATH=$HOME/.config
