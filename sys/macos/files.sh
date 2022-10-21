#!/bin/sh

remove_old_files() {
	echo "Removing old .files"
	(
	rm -rf "$HOME"/.cache/nvim &
	rm -rf "$HOME"/.local/share/nvim
	)
	wait
}

install_config_files() {
	echo "Installing .config files"
	config_path=$HOME/.config/
	mkdir -p "$config_path"
	
	if [[ $(uname -m) == 'arm64' ]]; then
		cp -rf sys/macos/m1/alacritty "$config_path"
	else 
		cp -rf sys/macos/alacritty "$config_path"
	fi
	(
	cp -rf nvim "$config_path" &
	cp -rf sys/macos/nushell "$HOME/Library/Application Support/"
	)
	wait
}

install_fonts() {
	echo "Installing fonts"
	fonts_path=sys/fonts/
	(
	cp "$fonts_path"MesloLGS\ NF\ Bold\ Italic.ttf ~/Library/Fonts/ &
	cp "$fonts_path"MesloLGS\ NF\ Bold.ttf ~/Library/Fonts/ &
	cp "$fonts_path"MesloLGS\ NF\ Italic.ttf ~/Library/Fonts/ &
	cp "$fonts_path"MesloLGS\ NF\ Regular.ttf ~/Library/Fonts/
	)
	wait
}

echo "-> Installing files"
(
remove_old_files &
install_config_files &
install_fonts
)
wait
echo "<- Files installation completed!"
