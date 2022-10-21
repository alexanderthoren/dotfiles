def getOs [] {
	let osName = (sys | get host | get name)
	if $osName == 'Darwin' {
		echo 'macos'
	} else if $osName == 'linux-gnu' {
		echo 'linux'
	} else if $osName == 'msys' {
		echo 'windows'
	} else {
		print 'os error'
		echo null
	}
}

def getFile [type: string] {
	if $type == '' {
		echo 'install.nu'
	} else if $type == 'f' {
		echo 'files.nu'
	} else if $type == 'b' {
		echo 'brew.nu'
	} else {
		print 'file type error'
		echo null
	}
}

def main [type: string = ''] {
	let os = getOs
	let file = getFile $type
	if ($os != null and $file != null) {
		let filePath = $'sys/($os)/($file)'
		nu $filePath
	} 
}
