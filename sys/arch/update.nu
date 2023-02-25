#!/usr/bin/env nu

let home = $env.HOME
let configPath = $'($home)/.config/'

def updateSystemHomeFiles [] {
	echo '-> Updating system home files'
	let myHomePath = $'sys/arch/.home/'
	cp -r $'($home)/.xsession' $myHomePath
	cp -r $'($home)/.screenlayout' $myHomePath
}

def updateSharedHomeFiles [] {
	echo '-> Updating shared home files'
	let myHomePath = $'sys/shared/.home/'
	cp -r $'($home)/.tmux.conf' $myHomePath
}

def updateSystemConfigFiles [] {
	echo '-> Updating system config files'
	let myConfigPath = $'sys/arch/.config/'
	cp -r $'(configPath)/alacritty' $myConfigPath
	cp -r $'(configPath)/bspwm' $myConfigPath
	cp -r $'(configPath)/rofi' $myConfigPath
	cp -r $'(configPath)/sxhkd' $myConfigPath
}

def updateSharedConfigFiles [] {
	echo '-> Updating shared config files'
	let myConfigPath = $'sys/shared/.config/'
	cp -r $'(configPath)/nvim' $myConfigPath
	cp -r $'(configPath)/nushell' $myConfigPath
}

def main [] {
	echo '-> Upding .files'
	updateSystemHomeFiles
	updateSharedHomeFiles
	updateSystemHomeFiles
	updateSharedHomeFiles
	echo '<- Files updated!'
}
