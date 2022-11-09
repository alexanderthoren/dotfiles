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
	brew install -q 'koekeishiya/formulae/yabai'
	brew install -q 'koekeishiya/formulae/skhd'
	brew install -q 'FelixKratz/formulae/sketchybar'
}

def stopServices [] {
	brew services stop yabai
	brew services stop skhd
	brew services stop sketchybar
}

def startServices [] {
	brew services start yabai
	brew services start skhd
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
