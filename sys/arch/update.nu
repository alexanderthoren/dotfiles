#!/usr/bin/env nu

let home = $env.HOME
let configPath = $'($home)/.config/'

def updateSystemHomeFiles [] {
	echo '-> Updating system home files'
	let myHomePath = $'sys/arch/.home/'
	cp -r $'($home)/.xsession' $myHomePath
	cp -r $'($home)/.screenlayout' $myHomePath
}

def updateSystemConfigFiles [] {
	echo '-> Updating system config files'
	let myConfigPath = $'sys/arch/.config/'
	cp -r $'($configPath)/alacritty/' $myConfigPath
	cp -r $'($configPath)/bspwm/' $myConfigPath
	cp -r $'($configPath)/rofi/' $myConfigPath
	cp -r $'($configPath)/sxhkd/' $myConfigPath
	cp -r $'($configPath)/nushell' $'sys/shared/.config/'
}

def main [] {
	echo '-> Upding .files'
	updateSystemHomeFiles
	updateSystemConfigFiles
	echo '<- Files updated!'
}
