def removeOldFiles [] {
	echo 'Removing old .files'
	rm -rf ~/.cache/nvim
	rm -rf ~/.local/share/nvim
}

def installConfigFiles [] {
	echo 'Installing .config files'
	let configPath = '~/.config/'
	mkdir $configPath
	if (uname -m) == 'arm64' {
		cp -r sys/macos/arm/alacritty $configPath
	} else {
		cp -r sys/macos/alacritty $configPath
	}
	cp -r nvim $configPath
	cp -r sys/macos/nushell '~/Library/Application Support/'
}

def installFonts [] {
	echo 'Installing fonts'
	let fontsPath = 'sys/fonts/'
	cp $'($fontsPath)MesloLGS NF Bold Italic.ttf' ~/Library/Fonts/
	cp $'($fontsPath)MesloLGS NF Bold.ttf' ~/Library/Fonts/
	cp $'($fontsPath)MesloLGS NF Italic.ttf' ~/Library/Fonts/
	cp $'($fontsPath)MesloLGS NF Regular.ttf' ~/Library/Fonts/
}

echo '-> Installing files'
removeOldFiles
installConfigFiles
installFonts
echo '<- Files installation completed!'
