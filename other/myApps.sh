#!/usr/bin/sh

#Casks
echo 'Installing casks'
brew install 'adguard'

#Mac App Store
echo 'Installing new apps'
mas install 409183694 #Keynote
mas install 441258766 #Magner
mas install 409203825 #Numbers
mas install 409201541 #Pages
mas install 497799835 #Xcode

#Upgrade Mac App Store apps
echo 'Upgrading apps'
mas upgrade
