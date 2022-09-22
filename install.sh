#!/bin/sh

echo "Installation started..."

echo "Current system is $OSTYPE"
if [[ "$OSTYPE" == "darwin"* ]]; then
	source sys/install.sh 1
fi

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	source sys/install.sh 0
fi

if [[ "$OSTYPE" == "msys" ]]; then
	source sys/windows/install.sh
fi

echo "Installation completed!"
