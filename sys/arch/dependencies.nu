#!/usr/bin/env nu

let home = $env.HOME

def pacman [] {
	print 'Updating and upgrading'
	sudo pacman -Syu
	print 'Installing pacman dependencies'
	sudo pacman -S --needed bspwm
	sudo pacman -S --needed lightdm lightdm-gtk-greeter
	sudo pacman -S --needed sxhkd
	sudo pacman -S --needed rofi
	sudo pacman -S --needed feh
	sudo pacman -S --needed git
	sudo pacman -S --needed neovim
	sudo pacman -S --needed alacritty
	sudo pacman -S --needed tmux
	sudo pacman -S --needed starship
	sudo pacman -S --needed neofetch
	sudo pacman -S --needed fzf
	sudo pacman -S --needed ripgrep
	sudo pacman -S --needed nodejs npm
	sudo pacman -S --needed shellcheck
	sudo pacman -S --needed bat
	sudo pacman -S --needed github-cli
	sudo pacman -S --needed kotlin
	sudo pacman -S --needed gradle
	sudo pacman -S --needed discord
	sudo pacman -S --needed flameshot
	sudo pacman -S --needed python-pip
}

def github [] {
	print 'Downloading github repositories'
	let repositories = ['rbenv', 'ruby-build']
	$repositories | each { |it|
		let url = $'https://aur.archlinux.org/($it).git'
		let repoPath = $'($home)/Downloads/($it)/'
		if not ($repoPath | path exists) {
			git clone $url $repoPath
		}
	}
}

def main [--clean (-c): int] {
	print '-> Dependencies installation'
	pacman
	github
	print '<- Dependencies installation completed!'
}
