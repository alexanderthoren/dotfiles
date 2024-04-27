#!/usr/bin/env -S just --justfile

# Cheatsheet -> https://cheatography.com/linux-china/cheat-sheets/justfile/

# This recipe only adds the latest changes of your dotfiles to your system
update:
  source update.sh

# This recipe only adds the latest changes of your system to your dotfiles
fetch:
  source fetch.sh

# This recipe installs all the required plugins and apps
full_installation:
  source full_installation.sh
