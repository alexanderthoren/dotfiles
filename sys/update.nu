#!/usr/bin/env nu

let home = $env.HOME
let configPath = $'($home)/.config/'

def updateHomeFiles [] {
	echo '-> Updating home files'
	let myHomePath = $'sys/shared/.home/'
	cp -r $'($home)/.tmux.conf' $myHomePath
}

def updateConfigFiles [] {
	echo '-> Updating config files'
	let myConfigPath = $'sys/shared/.config/'
	cp -r $'($configPath)/nvim' $myConfigPath
}

def main [os: string] {
	echo '-> Updating shared files'
	updateHomeFiles
	updateConfigFiles
	echo '<- Shared files updated!'
	nu $'sys/($os)/update.nu'
}
