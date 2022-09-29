#!/bin/sh

echo "Installation started..."

echo "Current system is $OSTYPE"
if [[ "$OSTYPE" == "darwin"* ]]; then
	source sys/macos/install.sh
fi

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	source sys/linux/install.sh
fi

if [[ "$OSTYPE" == "msys" ]]; then
	source sys/windows/install.sh
fi

echo "Installation completed!"
