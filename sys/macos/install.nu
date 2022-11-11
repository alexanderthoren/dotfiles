def main [] {
	echo '-> Full installation'
	let macos_path = 'sys/macos'
	nu $'($macos_path)/files.nu'
	nu $'($macos_path)/dependencies.nu'
	nu $'($macos_path)/apps.nu'
	echo '<- Full installation completed'
}
