#!/bin/sh
# shellcheck disable=SC3000-SC4000

dotfiles_dir="$(dirname "$0")"

ostype=$OSTYPE
command=$1

if [[ $ostype == "darwin"* ]]; then
	folder="macos"
elif [[ $ostype == "linux-gnu"* ]]; then
	folder="ubuntu"
fi

if [[ $command == "u" ]]; then
	file="update.sh"
elif [[ $command == "f" ]]; then
	file="fetch.sh"
fi

# shellcheck source=/dev/null
source "$dotfiles_dir/sys/$folder/$file"
