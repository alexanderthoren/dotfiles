#!/bin/sh

install_source_dotfiles() {
	echo "Installing and sourcing .files"
	dotfiles_path=sys/.files/
	(
	cp -f "$dotfiles_path".p10k.zsh "$HOME" &
	cp -f "$dotfiles_path".zshrc "$HOME" &
	cp -rf "$dotfiles_path".zsh "$HOME"
	)
	wait
	source "$HOME"/.zshrc
}

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
	(
	cp -rf sys/macos/alacritty "$config_path" &
	cp -rf nvim "$config_path"
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
install_source_dotfiles &
remove_old_files &
install_config_files &
install_fonts
)
wait
echo "<- Files installation completed!"
