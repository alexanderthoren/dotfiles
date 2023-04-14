#!/usr/bin/env nu

def main [--clean (-c): int] {
	print '-> Full installation'
	let arch_path = ('sys/arch')
	nu $'($arch_path)/dependencies.nu'
	nu $'($arch_path)/files.nu' -c $clean
	print '<- Full installation completed'
}
