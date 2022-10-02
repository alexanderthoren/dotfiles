#!/bin/sh

verify_install_brew() {
	echo "Verifying if Homebrew is installed"
	if [[ $(command -v brew) == "" ]]; then
		echo "Installing Homebrew"
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	fi
}

update_upgrade_brew() {
	echo "Updating and upgrading Homebrew"
	buu
}

tap_dependencies() {
	echo "Tap dependencies"
	(
	bt "homebrew/core" &
	bt "romkatv/powerlevel10k" &
	bt "homebrew/cask" &
	bt "homebrew/cask-fonts"
	)
	echo "Dependencies tap completed!"
}

install_casks() {
	echo "Installing casks"
	(
	biq "alacritty" --no-quarantine &
	biq "proxyman" &
	biq "stats"
	)
	wait
	echo "Casks installation completed!"
}

install_binaries() {
	echo "Installing binaries"
	(
	biq "coreutils" &
	biq "git" &
	biq "neovim" &
	biq "fzf" &
	biq "ripgrep" &
	biq "powerlevel10k" &
	biq "node" &
	biq "shellcheck" &
	biq "TheZoraiz/ascii-image-converter/ascii-image-converter"
	)
	wait
	echo "Binaries installation completed!"
}

echo "-> Brew installation"
verify_install_brew
update_upgrade_brew
tap_dependencies
(
install_casks &
install_binaries
)
wait
echo "<- Brew installation completed!"
