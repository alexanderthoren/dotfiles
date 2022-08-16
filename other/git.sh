#!/bin/sh

# user.email & user.name

git config --global user.email "$1"
git config --global user.name "$2"

#git config --global core.editor "nvim"
#git config --global init.defaultBranch "main"
#git config --global diff.tool "vimdiff"
#git config --global merge.tool "vimdiff"
#git config --global mergetool.vimdiff.path "nvim"
