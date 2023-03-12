#!/usr/bin/env nu
def updateAndUpgrade [] {
	echo 'Updating and upgrading'
	sudo pacman -Syu
}

def installDependencies [] {
	echo 'Installing dependencies'
	sudo pacman -Syu --needed bspwm
	sudo pacman -Syu --needed lightdm lightdm-gtk-greeter
	sudo pacman -Syu --needed sxhkd
	sudo pacman -Syu --needed rofi
	sudo pacman -Syu --needed feh
	sudo pacman -Syu --needed git
	sudo pacman -Syu --needed neovim
	sudo pacman -Syu --needed alacritty
	sudo pacman -Syu --needed tmux
	sudo pacman -Syu --needed starship
	sudo pacman -Syu --needed neofetch
	sudo pacman -Syu --needed fzf
	sudo pacman -Syu --needed ripgrep
	sudo pacman -Syu --needed nodejs npm
	sudo pacman -Syu --needed shellcheck
	sudo pacman -Syu --needed bat
	sudo pacman -Syu --needed github-cli
	sudo pacman -Syu --needed kotlin
}

def main [] {
	echo '-> Dependencies installation'
	updateAndUpgrade
	installDependencies
	echo '<- Dependencies installation completed!'
}
