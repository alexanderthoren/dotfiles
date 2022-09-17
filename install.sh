#!/bin/sh

if [[ "$OSTYPE" == "darwin"* ]]; then
	source sys/install.sh 1
fi

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	source sys/install.sh 0
fi

if [[ "$OSTYPE" == "win32" ]]; then
	source sys/windows/install.sh
fi
