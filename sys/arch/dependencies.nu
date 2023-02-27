#!/usr/bin/env nu
def updateAndUpgrade [] {
	echo 'Updating and upgrading'
	sudo pacman -Syu
}

def installDependencies [] {
	echo 'Installing dependencies'
	sudo pacman -Sy --needed bspwm
	sudo pacman -Sy --needed lightdm lightdm-gtk-greeter
	sudo pacman -Sy --needed sxhkd
	sudo pacman -Sy --needed rofi
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

def main [] {
	echo '-> Dependencies installation'
	updateAndUpgrade
	installDependencies
	echo '<- Dependencies installation completed!'
}
