#!/bin/sh

ostype=$OSTYPE

if [[ $ostype == "darwin"* ]]; then
	source sys/macos/install.sh
fi

if [[ $ostype == "linux-gnu"* ]]; then
	source sys/ubuntu/install.sh false
fi
