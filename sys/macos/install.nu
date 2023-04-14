#!/usr/bin/env nu

def main [--clean (-c): int] {
	print '-> Full installation'
	let macos_path = ('sys/macos')
	nu $'($macos_path)/files.nu' -c $clean
	nu $'($macos_path)/dependencies.nu'
	nu $'($macos_path)/apps.nu'
	print '<- Full installation completed'
}
