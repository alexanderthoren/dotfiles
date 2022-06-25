#!/bin/sh

echo "Setting up MINGW64_NT"

NVIM_PATH=$HOME/AppData/Local/nvim

rm -rf $NVIM_PATH
rm -rf $HOME/AppData/Local/nvim-data/site

cp -rf ./nvim $NVIM_PATH
