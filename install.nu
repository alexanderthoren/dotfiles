#!/usr/bin/env nu
def getOs [] {
	let osName = (sys | get host | get name)
	if $osName == 'Darwin' {
		echo 'macos'
	} else if $osName == 'Arch Linux' {
		echo 'arch'
	} else if $osName == 'Ubuntu' {
		echo 'ubuntu'
	} else {
		print $'Error: current os name is ($osName)'
		echo null
	}
}

def getFile [type: string] {
	if $type == '' {
		echo 'install.nu'
	} else if $type == 'f' {
		echo 'files.nu'
	} else if $type == 'd' {
		echo 'dependencies.nu'
	} else if $type == 'a' {
		echo 'apps.nu'
	} else {
		print $'Error: installation type is ($type)'
		echo null
	}
}

def main [
	--type (-t): string = '',
	--clean (-c) = false
] {
	let os = (getOs)
	let file = (getFile $type)
	if ($os != null and $file != null) {
		let filePath = ($'sys/($os)/($file)')
		print $filePath
		if $clean {
			nu $filePath -c 1
		} else {
			nu $filePath -c 0
		}
	} 
}
