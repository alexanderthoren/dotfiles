def main [] {
	echo '-> Full installation'
	let macos_path = 'sys/macos/'
	nu $'($macos_path)files.nu'
	nu $'($macos_path)brew.nu'
	echo '<- Full installation completed'
}
