def main [--clean (-c): int] {
	echo '-> Full installation'
	let windowsPath = 'sys/windows'
	nu $'($windowsPath)/files.nu' -c $clean
	nu $'($windowsPath)/dependencies.nu'
	echo '<- Full installation completed!'
}
