#!/bin/sh

ssh-keygen -t ed25519 -C "$1"

echo "Deleting old config and adding new one"
rm ~/.ssh/config
touch ~/.ssh/config

echo "Creating config file"
echo "Host *" >> ~/.ssh/config
echo "  IgnoreUnknown AddKeysToAgent,UseKeychain" >> ~/.ssh/config
echo "  AddKeysToAgent yes" >> ~/.ssh/config
echo "  UseKeychain yes" >> ~/.ssh/config
echo "  IdentityFile ~/.ssh/id_ed25519" >> ~/.ssh/config

echo "ssh-agent started"
eval "$(ssh-agent -s)"

echo "Current system is $OSTYPE"
if [[ "$OSTYPE" == "darwin"* ]]; then
	ssh-add -K ~/.ssh/id_ed25519
	pbcopy < ~/.ssh/id_ed25519.pub
fi

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	ssh-add ~/.ssh/id_ed25519
	cat ~/.ssh/id_ed25519.pub | clip.exe
fi

if [[ "$OSTYPE" == "msys" ]]; then
	ssh-add ~/.ssh/id_ed25519
	clip < ~/.ssh/id_ed25519.pub
fi

