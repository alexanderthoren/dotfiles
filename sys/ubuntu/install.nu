#!/usr/bin/env nu

def main [--clean (-c): int] {
	print '-> Full installation'
	let ubuntu_path = ('sys/ubuntu')
	nu $'($ubuntu_path)/files.nu' -c $clean
	nu $'($ubuntu_path)/dependencies.nu'
	print '<- Full installation completed'
}
