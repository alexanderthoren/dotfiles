def updateAndUpgradeBrew [] {
	echo 'Updating and upgrading Hombrew'
	brew update -q
	brew upgrade -q
}

def tapDependencies [] {
	echo 'Tap dependencies'
	brew tap -q 'homebrew/core'
	brew tap -q 'homebrew/cask'
	brew tap -q 'homebrew/cask-fonts'
}

def installCasks [] {
	echo 'Installing casks'
	brew install -q 'alacritty' --no-quarantine
	brew install -q 'proxyman'
	brew install -q 'stats'
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
}

echo '-> Brew installation'
updateAndUpgradeBrew
tapDependencies
installCasks
installBinaries
echo '<- Brew installation completed!'
