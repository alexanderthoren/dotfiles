def installRoamingFiles [] {
	echo 'Installing roaming files'
	let appDataPath = $env.APPDATA
	cp -r sys/windows/alacritty $appDataPath
	cp -r sys/shared/nushell $appDataPath
}

def installLocalFiles [] {
	echo 'Installing local files'
	let appDataLocalPath = $env.LOCALAPPDATA
	rm -rf $'($appDataLocalPath)/nvim-data/site'
	rm -rf $'($appDataLocalPath)/nvim'
	cp -r nvim $appDataLocalPath
}

def main [--clean (-c): int] {
	if $clean == 1 {
	}
	echo '-> Installing files'
	installRoamingFiles
	installLocalFiles
	echo '<- Files installation completed!'
}
