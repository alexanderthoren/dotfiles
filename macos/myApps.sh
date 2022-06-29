#!/bin/sh

#Casks
echo 'Installing casks'
#brew install 

#Mac App Store
echo 'Installing new apps'
mas install 409183694 #Keynote
mas install 441258766 #Magnet
mas install 409203825 #Numbers
mas install 409201541 #Pages
mas install 497799835 #Xcode
mas install 1440147259 #AdGuard for Safari

#Upgrade Mac App Store apps
echo 'Upgrading apps'
mas upgrade
