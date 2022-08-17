#!/bin/sh

if [[ "$OSTYPE" == "darwin"* ]]; then
	echo "Found darwin"
	source ./macos/install.sh
fi

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	echo "Found linux-gnu"
	source ./linux/install.sh
fi

if [[ "$OSTYPE" == "win32" ]]; then
	echo "Found win32"
	source ./windows/install.sh
fi

# Close the terminal
echo "Installation completed!"
#exit
