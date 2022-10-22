def main [] {
	echo '-> Full installation'
	let windowsPath = 'sys/windows'
	nu $'($windowsPath)/files.nu'
	nu $'($windowsPath)/dependencies.nu'
	echo '<- Full installation completed!'
}
