#!/bin/sh

get_os() {
	type=$OSTYPE
	if [[ "$type" == "darwin"* ]]; then
		echo "macos"
	elif [[ "$type" == "linux-gnu"* ]]; then
		echo "linux"
	elif [[ "$type" == "msys" ]]; then
		echo "windows"
	else
		echo "-1"
	fi
}

get_file() {
	type=$1
	if [[ "$type" == "" ]]; then
		echo "install.sh"
	elif [[ "$type" == "f" ]]; then
		echo "files.sh"
	elif [[ "$type" == "b" ]]; then
		echo "brew.sh"
	else
		echo "-1"
	fi
}

os=$(get_os)
file=$(get_file "$1")

if [[ "$os" == "-1"  ]]; then
	echo "OS not found!"
elif [[ "$file" == "-1" ]]; then
	echo "Command not found!"
else
	file_path=sys/$os/$file
	source "$file_path"
fi
