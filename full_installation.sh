#!/bin/zsh

# 1. Copy this file from the dotfiles repo to your ~ (root)
# 2. run chmod -x full_installation.sh
# 3. source full_installation.sh

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/alexanderthoren/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install Github CLI
brew install gh
gh auth login

# Clone dotfiles
mkdir Developer
cd Developer
gh repo clone dotfiles
cd dotfiles

# Copy macos home files
cp sys/macos/.home/.zprofile ~
cp sys/macos/.home/.zshrc ~

# Copy macos ~/.config files
cp sys/macos/.config/alacritty ~/.config

# Copy shared home files
cp sys/shared/.home/.gitconfig ~
cp sys/shared/.home/.tmux.conf ~

# Copy shared ~/.config files
cp sys/shared/.config/starship.toml ~/.config
cp -r sys/shared/.config/nvim ~/.config

# Install nerd fonts
cp sys/shared/fonts/MesloLGS/MesloLGS\ NF\ Bold\ Italic.ttf ~/Library/Fonts
cp sys/shared/fonts/MesloLGS/MesloLGS\ NF\ Bold.ttf ~/Library/Fonts
cp sys/shared/fonts/MesloLGS/MesloLGS\ NF\ Italic.ttf ~/Library/Fonts
cp sys/shared/fonts/MesloLGS/MesloLGS\ NF\ Regular.ttf ~/Library/Fonts

# Install apps
brew install --no-quarantine alacritty

# Install system plugins
brew tap koekeishiya/formulae
brew tap FelixKratz/formulae
brew install yabai
brew install skhd
brew install borders
brew install sketchybar

# Install terminal plugins
brew install tmux
brew install starship
brew install nvim
brew install bat
brew install fzf
brew install ripgrep
brew install pre-commit
brew install xcodes
brew install sourcery
brew install peripheryapp/periphery/periphery
brew install node

# Install zip apps
cp -r sys/macos/apps/Vimac.zip /Applications/
tar -xf /Applications/Vimac.zip -C /Applications/
rm /Applications/Vimac.zip
cp -r sys/macos/apps/SourceryPro.zip /Applications/
tar -xf /Applications/SourceryPro.zip -C /Applications/
rm /Applications/SourceryPro.zip
