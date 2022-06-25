#!/bin/sh

echo "Setting up..."

if [ "$(uname)" == "Darwin" ]; then
	source ./macos/install.sh
#elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
#elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
	source ./windows/install.sh
fi

# Close the terminal
echo "Installation completed!"
#exit
