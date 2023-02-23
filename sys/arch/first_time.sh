#!/bin/sh

sudo pacman -Sy nushell

chsh -s "$ (which nu)"
