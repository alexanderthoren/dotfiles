#!/usr/bin/env nu

let home = $env.HOME
let configPath = $'($home)/.config/'

def updateConfigFiles [] {
	print '-> Updating system config files'
	let myConfigPath = ($'sys/ubuntu/.config/')
	cp -r $'($configPath)/alacritty/' $myConfigPath
	cp -r $'($configPath)/nushell' $'sys/shared/.config/'
}

def main [] {
	print '-> Updating macOS files'
	updateConfigFiles
	print '<- macOS files updated!'
}
