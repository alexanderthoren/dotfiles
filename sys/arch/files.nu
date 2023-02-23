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
	cp -r sys/arch/alacritty $configPath
	cp -r nvim $configPath
}

def installTmuxFiles [] {
	cp -r sys/shared/tmux/.tmux.conf $home
}

def main [--clean (-c): int] {
	if $clean == 1 {
		echo '-> Removing old files'
		removeOldFiles
		echo '<- Old files removed!'
	}
	echo '-> Installing files'
	installConfigFiles
	installTmuxFiles
	echo '<- Files installation completed!'
}
