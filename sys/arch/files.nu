#!/usr/bin/env nu

let home = ($env.HOME)
let configPath = ($'($home)/.config/')

def removeOldFiles [] {
	print 'Removing old .files'
	rm -rf $'($home)/.cache/nvim'
	rm -rf $'($home)/.local/share/nvim'
	rm -rf $'($configPath)/nvim'
}

def createDirectories [] {
	print 'Creating directories'
	mkdir $configPath
}

def installSystemHomeFiles [] {
	print 'Installing system home files'
	let myHomePath = ($'sys/arch/.home/')
	cp -r $'($myHomePath)/.xsession' $home
	cp -r $'($myHomePath)/.screenlayout' $home
	cp -r $'($myHomePath)/.fehbg' $home
}

def installSharedHomeFiles [] {
	print 'Installing shared home files'
	let myHomePath = ($'sys/shared/.home/')
	cp -r $'($myHomePath)/.tmux.conf' $home
}

def installSystemConfigFiles [] {
	print 'Installing system config files'
	let myConfigPath = ($'sys/arch/.config/')
	cp -r $'($myConfigPath)/alacritty' $configPath
	cp -r $'($myConfigPath)/bspwm' $configPath
	cp -r $'($myConfigPath)/rofi' $configPath
	cp -r $'($myConfigPath)/sxhkd' $configPath
	cp -r $'($myConfigPath)/polybar' $configPath
	cp -r $'($myConfigPath)/pavucontrol.ini' $configPath
}

def installSharedConfigFiles [] {
	print 'Installing shared config files'
	let myConfigPath = ($'sys/shared/.config/')
	cp -r $'($myConfigPath)/nvim' $configPath
	cp -r $'($myConfigPath)/nushell' $configPath
	cp -r $'($myConfigPath)/starship.toml' $configPath
}

def installEtcConfigFiles [] {
	print 'Installing etc config files'
	sudo cp -r sys/arch/etc /
	sudo cp -r sys/shared/wallpapers/wallpaper.jpg /usr/share/pixmaps/
}

def installFonts [] {
	print 'Installing fonts'
	let fontsPath = ('/usr/local/share/fonts')
	let ttfFontsPath = ($'($fontsPath)/ttf')
	let otfFontsPath = ($'($fontsPath)/otf')
	let myFontsPath = ('sys/shared/fonts/')
	if not ($fontsPath | path exists) {
		sudo mkdir $fontsPath
		sudo mkdir $ttfFontsPath
		sudo mkdir $otfFontsPath
	}
	sudo cp -r $'($myFontsPath)/MesloLGS' $ttfFontsPath
}

def cloneGitRepositories [] {
	print 'Cloning git repositories'
	let tpmPath = ('~/.tmux/plugins/tpm')
	if not ($tpmPath | path exists) {
		git clone https://github.com/tmux-plugins/tpm $tpmPath
	}
}

def main [--clean (-c): int] {
	if $clean == 1 {
		print '-> Removing old files'
		removeOldFiles
		print '<- Old files removed!'
	}
	print '-> Installing files'
	createDirectories
	installSystemHomeFiles
	installSharedHomeFiles
	installSystemConfigFiles
	installSharedConfigFiles
	installEtcConfigFiles
	installFonts
	cloneGitRepositories
	print '<- Files installation completed!'
}
