#!/usr/bin/env nu

def main [] {
	echo '-> Installing apps'
	cp -r sys/macos/apps/Vimac.zip /Applications/
	tar -xf /Applications/Vimac.zip -C /Applications/
	rm /Applications/Vimac.zip
	echo '<- Apps installation completed'
}
