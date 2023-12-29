#!/usr/bin/env nu

def updateAndUpgradeBrew [] {
	echo 'Updating and upgrading Hombrew'
	brew update -q
	brew upgrade -q
}

def tapDependencies [] {
	echo 'Tap dependencies'
	brew tap -q 'homebrew/core'
	brew tap -q 'homebrew/cask-fonts'
	brew tap -q 'koekeishiya/formulae'
	brew tap -q 'FelixKratz/formulae'
}

def installCasks [] {
	echo 'Installing casks'
	brew install -q 'alacritty' --no-quarantine
	brew install -q 'proxyman'
}

def installBinaries [] {
	echo 'Installing binaries'
	brew install -q 'tmux'
	brew install -q 'starship'
	brew install -q 'coreutils'
	brew install -q 'git'
	brew install -q 'neovim'
	brew install -q 'fzf'
	brew install -q 'ripgrep'
	brew install -q 'node'
	brew install -q 'shellcheck'
	brew install -q 'TheZoraiz/ascii-image-converter/ascii-image-converter'
	brew install -q 'neofetch'
	brew install -q 'bat'
	brew install -q 'yabai'
	brew install -q 'skhd'
	brew install -q 'sketchybar'
	brew install -q 'gh'
	brew install -q 'kotlin'
	brew install -q 'fnm'
	brew install -q 'rbenv'
	brew install -q 'ruby-build'
}

def stopServices [] {
	brew services stop sketchybar
}

def startServices [] {
	brew services start sketchybar
}

echo '-> Brew installation'
stopServices
updateAndUpgradeBrew
tapDependencies
installCasks
installBinaries
startServices
echo '<- Brew installation completed!'
