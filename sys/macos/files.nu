let home = $env.HOME

def removeOldFiles [] {
	echo 'Removing old .files'
	rm -rf $'($home)/.cache/nvim'
	rm -rf $'($home)/.local/share/nvim'
}

def installConfigFiles [] {
	echo 'Installing .config files'
	let configPath = $'($home)/.config/'
	mkdir $configPath
	cp -r sys/macos/alacritty $configPath
	if (uname -m | str trim) == 'arm64' {
		let alacrittyPath = $'($configPath)/alacritty/alacritty.yml'
		(
			cat $alacrittyPath |
			str replace "/usr/local/bin/nu" "/opt/homebrew/bin/nu" |
			save -f $alacrittyPath
		)
	}
	cp -r nvim $configPath
	cp -r sys/shared/nushell $'($home)/Library/Application Support/'
}

def installYabaiFiles [] {
	let whoami = $'(whoami | str trim)'
	let brewYabai = $'(which yabai | get path | get 0)'
	let shasum = $'(shasum -a 256 ($brewYabai) | str trim)'
	let data = $"($whoami) ALL = \(root) NOPASSWD: sha256:($shasum) --load-sa"
	echo $data | save -f sys/macos/yabai/yabai
	sudo cp sys/macos/yabai/yabai /private/etc/sudoers.d/yabai
	rm sys/macos/yabai/yabai

	cp sys/macos/yabai/.yabairc $home
	chmod +x $'($home)/.yabairc'
}

def installSkhdFiles [] {
	cp sys/macos/skhd/.skhdrc $home
	cp sys/macos/skhd/com.koekeishiya.skhd.plist $'($home)/Library/LaunchAgents'
}

def installSketchybarFiles [] {
	cp -r sys/macos/sketchybar $'($home)/.config/'
}

def installTmuxFiles [] {
	cp -r sys/macos/tmux/.tmux.conf $home
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
	installConfigFiles
	installYabaiFiles 
	installSkhdFiles
	installSketchybarFiles
	installTmuxFiles
	installFonts
	echo '<- Files installation completed!'
}
