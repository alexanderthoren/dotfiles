def updateAndUpgrade [] {
	echo 'Updating and upgrading'
	sudo pacman -Syu
}

def installDependencies [] {
	echo 'Installing dependencies'
	sudo pacman -Sy --needed git
	sudo pacman -Sy --needed neovim
	sudo pacman -Sy --needed alacritty
	sudo pacman -Sy --needed tmux
	sudo pacman -Sy --needed starship
	sudo pacman -Sy --needed neofetch
	sudo pacman -Sy --needed fzf
	sudo pacman -Sy --needed ripgrep
	sudo pacman -Sy --needed nodejs npm
	sudo pacman -Sy --needed shellcheck
	sudo pacman -Sy --needed bat
	sudo pacman -Sy --needed github-cli
}

echo '-> Dependencies installation'
updateAndUpgrade
installDependencies
echo '<- Dependencies installation completed!'
