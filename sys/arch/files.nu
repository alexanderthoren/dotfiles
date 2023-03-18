#!/usr/bin/env nu

let home = $env.HOME
let configPath = $'($home)/.config/'

def removeOldFiles [] {
	echo 'Removing old .files'
	rm -rf $'($home)/.cache/nvim'
	rm -rf $'($home)/.local/share/nvim'
}

def createDirectories [] {
	echo 'Creating directories'
	mkdir $configPath
}

def installSystemHomeFiles [] {
	echo 'Installing system home files'
	let myHomePath = $'sys/arch/.home/'
	cp -r $'($myHomePath)/.xsession' $home
	cp -r $'($myHomePath)/.screenlayout' $home
	cp -r $'($myHomePath)/.fehbg' $home
}

def installSharedHomeFiles [] {
	echo 'Installing shared home files'
	let myHomePath = $'sys/shared/.home/'
	cp -r $'($myHomePath)/.tmux.conf' $home
}

def installSystemConfigFiles [] {
	echo 'Installing system config files'
	let myConfigPath = $'sys/arch/.config/'
	cp -r $'($myConfigPath)/alacritty' $configPath
	cp -r $'($myConfigPath)/bspwm' $configPath
	cp -r $'($myConfigPath)/rofi' $configPath
	cp -r $'($myConfigPath)/sxhkd' $configPath
	cp -r $'($myConfigPath)/polybar' $configPath
	cp -r $'($myConfigPath)/pavucontrol.ini' $configPath
	cp -r $'($myConfigPath)/starship.toml' $configPath
}

def installSharedConfigFiles [] {
	echo 'Installing shared config files'
	let myConfigPath = $'sys/shared/.config/'
	cp -r $'($myConfigPath)/nvim' $configPath
	cp -r $'($myConfigPath)/nushell' $configPath
}

def installEtcConfigFiles [] {
	echo 'Installing etc config files'
	sudo cp -r sys/arch/etc /
	sudo cp -r sys/shared/wallpapers/wallpaper.jpg /usr/share/pixmaps/
}

def installFonts [] {
	echo 'Installing fonts'
	let fontsPath = '/usr/local/share/fonts'
	let ttfFontsPath = $'($fontsPath)/ttf'
	let otfFontsPath = $'($fontsPath)/otf'
	let myFontsPath = 'sys/shared/fonts/'
	if not ($fontsPath | path exists) {
		sudo mkdir $fontsPath
		sudo mkdir $ttfFontsPath
		sudo mkdir $otfFontsPath
	}
	sudo cp -r $'($myFontsPath)/MesloLGS' $ttfFontsPath
}

def main [--clean (-c): int] {
	if $clean == 1 {
		echo '-> Removing old files'
		removeOldFiles
		echo '<- Old files removed!'
	}
	echo '-> Installing files'
	createDirectories
	installSystemHomeFiles
	installSharedHomeFiles
	installSystemConfigFiles
	installSharedConfigFiles
	installEtcConfigFiles
	installFonts
	echo '<- Files installation completed!'
}
