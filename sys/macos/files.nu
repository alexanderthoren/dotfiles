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
	let myHomePath = ($'sys/macos/.home/')
	let whoami = ($'(whoami | str trim)')
	let brewYabai = ($'(which yabai | get path | get 0)')
	let shasum = ($'(shasum -a 256 ($brewYabai) | str trim)')
	let data = ($"($whoami) ALL = \(root) NOPASSWD: sha256:($shasum) --load-sa")
	echo $data | save -f $'($myHomePath)/yabai'
	sudo cp -r $'($myHomePath)/yabai' /private/etc/sudoers.d/yabai
	rm -r $'($myHomePath)/yabai' 
	cp -r $'($myHomePath)/.yabairc' $home
	cp -r $'($myHomePath)/skhd/.skhdrc' $home
}

def installSharedHomeFiles [] {
	print 'Installing shared home files'
	let myHomePath = ($'sys/shared/.home/')
	cp -r $'($myHomePath)/.tmux.conf' $home
}

def installSystemConfigFiles [] {
	print 'Installing system config files'
	let myConfigPath = ($'sys/macos/.config/')
	cp -r $'($myConfigPath)/alacritty' $configPath
	cp -r $'($myConfigPath)/sketchybar' $configPath
	cp -r $'sys/shared/.config/nushell' $'($home)/Library/Application Support/'
}

def installSharedConfigFiles [] {
	print 'Installing shared config files'
	let myConfigPath = ($'sys/shared/.config/')
	cp -r $'($myConfigPath)/starship.toml' $configPath
	cp -r $'($myConfigPath)/nvim' $configPath
}

def installFonts [] {
	print 'Installing fonts'
	let fontsPath = ('sys/shared/fonts/MesloLGS/')
	cp $'($fontsPath)MesloLGS NF Bold Italic.ttf' $'($home)/Library/Fonts/'
	cp $'($fontsPath)MesloLGS NF Bold.ttf' $'($home)/Library/Fonts/'
	cp $'($fontsPath)MesloLGS NF Italic.ttf' $'($home)/Library/Fonts/'
	cp $'($fontsPath)MesloLGS NF Regular.ttf' $'($home)/Library/Fonts/'
}

def cloneGitRepositories [] {
	print 'Cloning git repositories'
	let tpmPath = ('~/.tmux/plugins/tpm')
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
	createDirectories
	installSystemHomeFiles
	installSharedHomeFiles
	installSystemConfigFiles
	installSharedConfigFiles
	installFonts
	cloneGitRepositories
	print '<- macOS files installation completed!'
}
