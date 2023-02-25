#!/usr/bin/env nu

let home = $env.HOME
let configPath = $'($home)/.config/'

def removeOldFiles [] {
	echo 'Removing old .files'
	rm -rf $'($home)/.cache/nvim'
	rm -rf $'($home)/.local/share/nvim'
}

def createDirectories [] {
	echo 'Creating directories'
	mkdir $configPath
}

def installSystemHomeFiles [] {
	echo 'Installing system home files'
	let myHomePath = $'sys/arch/.home/'
	cp -r $'($myHomePath)/.xsession' $home
	cp -r $'($myHomePath)/.screenlayout' $home
}

def installSharedHomeFiles [] {
	echo 'Installing shared home files'
	let myHomePath = $'sys/shared/.home/'
	cp -r $'($myHomePath)/.tmux.conf' $home
}

def installSystemConfigFiles [] {
	echo 'Installing system config files'
	let myConfigPath = $'sys/arch/.config/'
	cp -r $'($myConfigPath)/alacritty' $configPath
	cp -r $'($myConfigPath)/bspwm' $configPath
	cp -r $'($myConfigPath)/rofi' $configPath
	cp -r $'($myConfigPath)/sxhkd' $configPath
}

def installSharedConfigFiles [] {
	echo 'Installing shared config files'
	let myConfigPath = $'sys/shared/.config/'
	cp -r $'($myConfigPath)/nvim' $configPath
	cp -r $'($myConfigPath)/nushell' $configPath
}

def main [--clean (-c): int] {
	if $clean == 1 {
		echo '-> Removing old files'
		removeOldFiles
		echo '<- Old files removed!'
	}
	echo '-> Installing files'
	createDirectories
	installSystemHomeFiles
	installSharedHomeFiles
	installSystemConfigFiles
	installSharedConfigFiles
	echo '<- Files installation completed!'
}
