#!/usr/bin/env nu

def updateAndUpgradeBrew [] {
	echo 'Updating and upgrading Hombrew'
	brew update -q
	brew upgrade -q
}

def tapDependencies [] {
	echo 'Tap dependencies'
	brew tap -q 'homebrew/cask-fonts'
}

def installBinaries [] {
	echo 'Installing binaries'
	sudo apt-get install alacritty
	brew install -q 'tmux'
	brew install -q 'starship'
	brew install -q 'git'
	brew install -q 'neovim'
	brew install -q 'fzf'
	brew install -q 'ripgrep'
	brew install -q 'shellcheck'
	brew install -q 'TheZoraiz/ascii-image-converter/ascii-image-converter'
	brew install -q 'neofetch'
	brew install -q 'bat'
	brew install -q 'gh'
	brew install -q 'node'
	brew install -q 'rbenv'
	brew install -q 'ruby-build'
	brew install -q 'python'
}

def installFrameworksWithPip [] {
	pip install "fastapi[all]"
}

echo '-> Brew installation'
updateAndUpgradeBrew
tapDependencies
installBinaries
echo '<- Brew installation completed!'
