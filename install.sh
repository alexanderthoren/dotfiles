#!/bin/sh


if [[ "$OSTYPE" == "darwin"* ]]; then
	source ./macos/install.sh
else
	source ./windows/install.sh
fi

# Close the terminal
echo "Installation completed!"
#exit
