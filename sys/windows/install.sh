#!/bin/sh

echo "Setting up WIN32"

cp -rf sys/windows/alacritty  /mnt/c/Users/alexi/appdata/Roaming/

# Install dependencies
echo "Installing dependencies"
choco install alacritty
choco install postman

# Install WSL2
echo "Instaling Windows Subsystem for Linux"
wsl --install
