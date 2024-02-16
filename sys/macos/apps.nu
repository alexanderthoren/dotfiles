#!/usr/bin/env nu

def main [] {
	echo '-> Installing apps'
	cp -r sys/macos/apps/Vimac.zip /Applications/
	tar -xf /Applications/Vimac.zip -C /Applications/
	rm /Applications/Vimac.zip
	cp -r sys/macos/apps/SourceryPro.zip /Applications/
	tar -xf /Applications/SourceryPro.zip -C /Applications/
	rm /Applications/SourceryPro.zip
	echo '<- Apps installation completed'
}
