#!/usr/bin/env nu

def getOs [] {
	let osName = (sys | get host | get name)
	if $osName == 'Darwin' {
		echo 'macos'
	} else if $osName == 'Arch Linux' {
		echo 'arch'
	} else {
		print $'Error: current os name is ($osName)'
		echo null
	}
}

def main [] {
	let os = getOs
	if $os != null {
		nu $'sys/update.nu' $os
	} 
}
