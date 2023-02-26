#!/usr/bin/env nu

let home = $env.HOME
let configPath = $'($home)/.config/'

def updateHomeFiles [] {
	echo '-> Updating system home files'
	let myHomePath = $'sys/macos/.home/'
	cp -r $'($home)/.yabairc' $myHomePath
	cp -r $'($home)/.skhdrc' $'($myHomePath)/skhd/'
}

def updateConfigFiles [] {
	echo '-> Updating system config files'
	let myConfigPath = $'sys/macos/.config/'
	cp -r $'($configPath)/alacritty/' $myConfigPath
	cp -r $'($configPath)/sketchybar/' $myConfigPath
	cp -r $'($home)/Library/Application Support/nushell' $'sys/shared/.config'
}

def main [] {
	echo '-> Updating macOS files'
	updateHomeFiles
	updateConfigFiles
	echo '<- macOS files updated!'
}
