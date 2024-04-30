#!/usr/bin/env bash

sudo apt-get install curl
sudo apt-get install git

if [[ $(command -v brew) == "" ]]; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/alexanderthoren/.bashrc
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
	sudo apt-get install build-essential
	brew install gcc
fi

sudo apt-get install zsh
chsh -s "$(which zsh)"
sudo chsh -s "$(which zsh)"
