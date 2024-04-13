#!/usr/bin/env -S just --justfile

# Cheatsheet -> https://cheatography.com/linux-china/cheat-sheets/justfile/

# This recipe only adds the latest changes of your dotfiles to your system
fetch_and_update:
	# Copy macos home files
	cp sys/macos/.home/.zprofile ~
	cp sys/macos/.home/.zshrc ~
	cp sys/macos/.home/.aerospace.toml ~

	# Copy macos ~/.config files
	rm -r ~/.config/alacritty
	cp -r sys/macos/.config/alacritty ~/.config
	rm -r ~/.config/sketchybar
	cp -r sys/macos/.config/sketchybar ~/.config

	# Copy shared home files
	cp sys/shared/.home/.tmux.conf ~
	cp sys/shared/.home/.tmuxsessions ~

	# Copy shared ~/.config files
	cp sys/shared/.config/starship.toml ~/.config
	rm -rf ~/.cache/nvim
	rm -rf ~/.local/share/nvim
	rm -r ~/.config/nvim
	cp -r sys/shared/.config/nvim ~/.config

# This recipe only adds the latest changes of your system to your dotfiles
update_dotfiles:
	# Copy macos home files
	cp ~/.zshrc sys/macos/.home
	cp ~/.zprofile sys/macos/.home
	cp ~/.aerospace.toml sys/macos/.home

	# Copy macos ~/.config files
	rm -r sys/macos/.config/alacritty
	cp -r ~/.config/alacritty sys/macos/.config
	rm -r sys/macos/.config/sketchybar
	cp -r ~/.config/sketchybar sys/macos/.config

	# Copy shared home files
	cp ~/.tmux.conf sys/shared/.home
	cp ~/.tmuxsessions sys/shared/.home

	# Copy shared ~/.config files
	cp  ~/.config/starship.toml sys/shared/.config
	rm -r sys/shared/.config/nvim
	cp -r ~/.config/nvim sys/shared/.config
