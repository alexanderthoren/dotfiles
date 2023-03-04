#!/usr/bin/env nu

let home = $env.HOME
let configPath = $'($home)/.config/'

def updateHomeFiles [] {
	echo '-> Updating system home files'
	let myHomePath = $'sys/arch/.home/'
	cp -r $'($home)/.xsession' $myHomePath
	cp -r $'($home)/.screenlayout' $myHomePath
	cp -r $'($home)/.fehbg' $myHomePath
}

def updateConfigFiles [] {
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
	updateHomeFiles
	updateConfigFiles
	echo '<- Files updated!'
}
