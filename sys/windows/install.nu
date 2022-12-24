def main [] {
	echo '-> Full installation'
	let windowsPath = 'sys/windows'
	nu $'($windowsPath)/dependencies.nu'
	nu $'($windowsPath)/files.nu'
	echo '<- Full installation completed!'
}
