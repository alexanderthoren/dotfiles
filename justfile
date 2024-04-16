#!/bin/sh
#!/usr/bin/env -S just --justfile

# Cheatsheet -> https://cheatography.com/linux-china/cheat-sheets/justfile/

# This recipe only adds the latest changes of your dotfiles to your system
fetch:
	# Copy macos home files
	cp sys/macos/.home/.zprofile ~
	cp sys/macos/.home/.zshrc ~
	cp sys/macos/.home/.aerospace.toml ~

	# Copy macos ~/.config files
	rm -r ~/.config/alacritty
	cp -r sys/macos/.config/alacritty ~/.config
	rm -r ~/.config/sketchybar
	cp -r sys/macos/.config/sketchybar ~/.config
	rm -r ~/.config/borders
	cp -r sys/macos/.config/borders ~/.config

	# Copy shared home files
	cp sys/shared/.home/.tmux.conf ~

	# Copy shared ~/.config files
	cp sys/shared/.config/starship.toml ~/.config
	rm -rf ~/.cache/nvim
	rm -rf ~/.local/share/nvim
	rm -r ~/.config/nvim
	cp -r sys/shared/.config/nvim ~/.config

# This recipe only adds the latest changes of your system to your dotfiles
update:
	# Copy macos home files
	cp ~/.zshrc sys/macos/.home
	cp ~/.zprofile sys/macos/.home
	cp ~/.aerospace.toml sys/macos/.home

	# Copy macos ~/.config files
	rm -r sys/macos/.config/alacritty
	cp -r ~/.config/alacritty sys/macos/.config
	rm -r sys/macos/.config/sketchybar
	cp -r ~/.config/sketchybar sys/macos/.config
	rm -r sys/macos/.config/borders
	cp -r ~/.config/borders sys/macos/.config

	# Copy shared home files
	cp ~/.tmux.conf sys/shared/.home

	# Copy shared ~/.config files
	cp  ~/.config/starship.toml sys/shared/.config
	rm -r sys/shared/.config/nvim
	cp -r ~/.config/nvim sys/shared/.config

# This recipe installs all the required plugins and apps
full_installation:
	cp sys/shared/.home/.gitconfig ~

	# Install nerd fonts
	cp sys/shared/fonts/MesloLGS/MesloLGS\ NF\ Bold\ Italic.ttf ~/Library/Fonts
	cp sys/shared/fonts/MesloLGS/MesloLGS\ NF\ Bold.ttf ~/Library/Fonts
	cp sys/shared/fonts/MesloLGS/MesloLGS\ NF\ Italic.ttf ~/Library/Fonts
	cp sys/shared/fonts/MesloLGS/MesloLGS\ NF\ Regular.ttf ~/Library/Fonts

	fetch_and_update

	# Install Xcode
	brew install xcodes
	xcodes install --latest

	# Install terminal plugins
	brew install tmux
	brew install starship
	brew install nvim
	brew install bat
	brew install fzf
	brew install ripgrep
	brew install pre-commit
	brew install sourcery
	brew install peripheryapp/periphery/periphery
	brew install node
	brew install zoxide
	brew install eza
	brew install zsh-autosuggestions
	brew install grex
	brew install thefuck
	brew install shellcheck
	brew install slides
	brew install bartib

	# Install apps
	brew install --no-quarantine alacritty
	brew install raycast
	brew install notion
	brew install superlist
	brew install monitorcontrol
	brew install postman
	brew install proxyman
	brew install linear-linear

	# Install system plugins
	brew tap FelixKratz/formulae
	brew install borders
	brew install sketchybar
	brew install nikitabobko/tap/aerospace

	# Install npm packages
	npm i -g carbon-now-cli

	# Install zip apps
	cp -r sys/macos/apps/Vimac.zip /Applications/
	tar -xf /Applications/Vimac.zip -C /Applications/
	rm /Applications/Vimac.zip
	cp -r sys/macos/apps/SourceryPro.zip /Applications/
	tar -xf /Applications/SourceryPro.zip -C /Applications/
	rm /Applications/SourceryPro.zip

	# Git Clone
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

	# Defaults configuration
	defaults write -g NSAutomaticWindowAnimationsEnabled -bool false

