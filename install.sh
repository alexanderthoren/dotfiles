#!/bin/sh

ostype=$OSTYPE

if [[ $ostype == "darwin"* ]]; then
	source sys/install.sh true
fi

if [[ $ostype == "linux-gnu"* ]]; then
	source sys/install.sh false
fi

if [[ "$OSTYPE" == "win32" ]]; then
	source sys/windows/install.sh
fi
