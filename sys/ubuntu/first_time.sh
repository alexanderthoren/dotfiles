#!/usr/bin/env bash

sudo apt-get install curl
sudo apt-get install git

if [[ $(command -v brew) == "" ]]; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	(
		echo
		echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"'
	) >>/home/alexanderthoren/.bashrc
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
	sudo apt-get install build-essential
	brew install gcc
fi

# Install zsh
sudo apt-get install zsh
chsh -s "$(which zsh)"
sudo chsh -s "$(which zsh)"

# Install alacritty
sudo apt-get install snap
sudo snap install alacritty --classic

sudo apt-get install bspwm
sudo apt-get install sxhkd
sudo apt-get install rofi
sudo apt-get install arandr

brew install bat
brew install feh
brew install neovim
brew install ripgrep
brew install starship
brew install thefuck
brew install tmux
brew install tree
brew install zoxide
brew install zsh-autosuggestions
brew install luarocks
luarocks install luacheck

# Install nerd fonts script
curl -fsSL https://raw.githubusercontent.com/getnf/getnf/main/install.sh | bash

cp ./../shared/wallpapers/Gruvbox Astro.jpg ~/Pictures/desktop_background.jpg
