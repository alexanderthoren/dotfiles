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
			save $alacrittyPath
		)
	}
	cp -r nvim $configPath
	cp -r sys/macos/nushell $'($home)/Library/Application Support/'
}

def installFonts [] {
	echo 'Installing fonts'
	let fontsPath = 'sys/fonts/'
	cp $'($fontsPath)MesloLGS NF Bold Italic.ttf' $'($home)/Library/Fonts/'
	cp $'($fontsPath)MesloLGS NF Bold.ttf' $'($home)/Library/Fonts/'
	cp $'($fontsPath)MesloLGS NF Italic.ttf' $'($home)/Library/Fonts/'
	cp $'($fontsPath)MesloLGS NF Regular.ttf' $'($home)/Library/Fonts/'
}

echo '-> Installing files'
removeOldFiles
installConfigFiles
installFonts
echo '<- Files installation completed!'
