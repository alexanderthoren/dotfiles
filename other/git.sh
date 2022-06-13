#!/bin/sh

rgit config --global user.email "$1"
git config --global user.name "$2"
git config --global core.editor "nvim"
git config --global init.defaultBranch "main"
