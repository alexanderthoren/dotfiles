#!/bin/sh

os_type=$OSTYPE
#echo "Current system is $os_type"

installation_type=$1
#echo "Installation type is $installation_type"

if [[ "$os_type" == "darwin"* ]]; then
	if [[ "$installation_type" == "" ]]; then
		source sys/macos/install.sh
	elif [[ "$installation_type" == "f" ]]; then
		source sys/macos/files.sh
	elif [[ "$installation_type" == "b" ]]; then
		source sys/macos/brew.sh
	else
		echo "Command not found."
	fi
elif [[ "$os_type" == "linux-gnu"* ]]; then
	source sys/linux/install.sh
elif [[ "$os_type" == "msys" ]]; then
	source sys/windows/install.sh
fi
