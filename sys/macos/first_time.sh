#!/bin/sh

if [[ $(command -v brew) == "" ]]; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

brew install -q "nushell"

sudo sh -c "echo $(which nu) >> /etc/shells"
chsh -s $(which nu)
