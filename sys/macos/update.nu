#!/usr/bin/env nu

let home = $env.HOME
let configPath = $'($home)/.config/'

def updateHomeFiles [] {
	print '-> Updating system home files'
	let myHomePath = ($'sys/macos/.home/')
	cp -r $'($home)/.yabairc' $myHomePath
	cp -r $'($home)/.skhdrc' $'($myHomePath)/skhd/'
}

def updateConfigFiles [] {
	print '-> Updating system config files'
	let myConfigPath = ($'sys/macos/.config/')
	cp -r $'($configPath)/alacritty/' $myConfigPath
	cp -r $'($configPath)/sketchybar/' $myConfigPath
	cp -r $'($home)/Library/Application Support/nushell' $'sys/shared/.config'
}

def main [] {
	print '-> Updating macOS files'
	updateHomeFiles
	updateConfigFiles
	print '<- macOS files updated!'
}
