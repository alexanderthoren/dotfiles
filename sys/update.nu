#!/usr/bin/env nu

let home = ($env.HOME)
let configPath = ($'($home)/.config/')

def updateHomeFiles [] {
	print '-> Updating home files'
	let myHomePath = ($'sys/shared/.home/')
	cp -r $'($home)/.tmux.conf' $myHomePath
}

def updateConfigFiles [] {
	print '-> Updating config files'
	let myConfigPath = ($'sys/shared/.config/')
	cp -r $'($configPath)/nvim' $myConfigPath
	cp -r $'($configPath)/starship.toml' $myConfigPath
}

def main [os: string] {
	print '-> Updating shared files'
	updateHomeFiles
	updateConfigFiles
	print '<- Shared files updated!'
	nu $'sys/($os)/update.nu'
}
