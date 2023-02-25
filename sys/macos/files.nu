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
	let myHomePath = $'sys/macos/.home/'
	let whoami = $'(whoami | str trim)'
	let brewYabai = $'(which yabai | get path | get 0)'
	let shasum = $'(shasum -a 256 ($brewYabai) | str trim)'
	let data = $"($whoami) ALL = \(root) NOPASSWD: sha256:($shasum) --load-sa"
	echo $data | save -f $'($myHomePath)/yabai'
	sudo cp -r $'($myHomePath)/yabai' /private/etc/sudoers.d/yabai
	rm -r $'($myHomePath)/yabai' 
	cp -r $'($myHomePath)/.yabairc' $home
	cp -r $'($myHomePath)/skhd/.skhdrc' $home
	cp -r $'($myHomePath)/skhd/com.koekeishiya.skhd.plist' $'($home)/Library/LaunchAgents'
}

def installSharedHomeFiles [] {
	echo 'Installing shared home files'
	let myHomePath = $'sys/shared/.home/'
	cp -r $'($myHomePath)/.tmux.conf' $home
}

def installSystemConfigFiles [] {
	echo 'Installing system config files'
	let myConfigPath = $'sys/macos/.config/'
	if (uname -m | str trim) == 'arm64' {
		let alacrittyPath = $'($myConfigPath)/alacritty/alacritty.yml'
		(
			cat $alacrittyPath |
			str replace "/usr/local/bin/nu" "/opt/homebrew/bin/nu" |
			save -f $alacrittyPath
		)
	}
	cp -r $'($myConfigPath)/alacritty' $configPath
	cp -r $'($myConfigPath)/sketchybar' $configPath
}

def installSharedConfigFiles [] {
	echo 'Installing shared config files'
	let myConfigPath = $'sys/shared/.config/'
	cp -r $'($myConfigPath)/nvim' $configPath
	cp -r $'($myConfigPath)/nushell' $'($home)/Library/Application Support/'
}

def installFonts [] {
	echo 'Installing fonts'
	let fontsPath = 'sys/shared/fonts/'
	cp $'($fontsPath)MesloLGS NF Bold Italic.ttf' $'($home)/Library/Fonts/'
	cp $'($fontsPath)MesloLGS NF Bold.ttf' $'($home)/Library/Fonts/'
	cp $'($fontsPath)MesloLGS NF Italic.ttf' $'($home)/Library/Fonts/'
	cp $'($fontsPath)MesloLGS NF Regular.ttf' $'($home)/Library/Fonts/'
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
	installFonts
	echo '<- Files installation completed!'
}
