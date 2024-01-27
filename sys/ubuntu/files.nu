#!/usr/bin/env nu

let home = ($env.HOME)
let configPath = ($'($home)/.config/')

def removeOldFiles [] {
	print 'Removing old .files'
	rm -rf $'($home)/.cache/nvim'
	rm -rf $'($home)/.local/share/nvim'
	rm -rf $'($configPath)/nvim'
}

def installSystemHomeFiles [] {
	print 'Installing system home files'
	let myHomePath = ($'sys/ubuntu/.home/')
}

def installSharedHomeFiles [] {
	print 'Installing shared home files'
	let myHomePath = ($'sys/shared/.home/')
	cp -r $'($myHomePath)/.tmux.conf' $home
}

def installSystemConfigFiles [] {
	print 'Installing system config files'
	let myConfigPath = ($'sys/ubuntu/.config/')
	cp -r $'($myConfigPath)/alacritty' $configPath
	cp -r $'sys/shared/.config/nushell' $configPath
}

def installSharedConfigFiles [] {
	print 'Installing shared config files'
	let myConfigPath = ($'sys/shared/.config/')
	cp -r $'($myConfigPath)/starship.toml' $configPath
	cp -r $'($myConfigPath)/nvim' $configPath
}

def installFonts [] {
	print 'Installing fonts'
	let fontsPath = '/usr/local/share/fonts'
	let ttfFontsPath = $'($fontsPath)/ttf'
	let otfFontsPath = $'($fontsPath)/otf'
	let myFontsPath = 'sys/shared/fonts/'
	if not ($fontsPath | path exists) {
		sudo mkdir $fontsPath
		sudo mkdir $ttfFontsPath
		sudo mkdir $otfFontsPath
		sudo cp -r $'($myFontsPath)/MesloLGS' $ttfFontsPath
	}
}

def cloneGitRepositories [] {
	print 'Cloning git repositories'
	let tpmPath = ($'($home)/.tmux/plugins/tpm')
	if not ($tpmPath | path exists) {
		git clone https://github.com/tmux-plugins/tpm $tpmPath
	}
}

def main [--clean (-c): int] {
	print '-> Installing macOS files'
	if $clean == 1 {
		print '-> Removing old files'
		removeOldFiles
		print '<- Old files removed!'
	}
	installSystemHomeFiles
	installSharedHomeFiles
	installSystemConfigFiles
	installSharedConfigFiles
	installFonts
	cloneGitRepositories
	print '<- macOS files installation completed!'
}
