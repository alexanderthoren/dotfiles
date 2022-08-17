#!/bin/sh

ssh-keygen -t ed25519 -C "$1"

eval "$(ssh-agent -s)"

rm ~/.ssh/config

touch ~/.ssh/config

echo "Host *" >> ~/.ssh/config
echo "  IgnoreUnknown AddKeysToAgent,UseKeychain" >> ~/.ssh/config
echo "  AddKeysToAgent yes" >> ~/.ssh/config
echo "  UseKeychain yes" >> ~/.ssh/config
echo "  IdentityFile ~/.ssh/id_ed25519" >> ~/.ssh/config

if [[ "$OSTYPE" == "darwin"* ]]; then
        echo "Found darwin"
	ssh-add -K ~/.ssh/id_ed25519
        pbcopy < ~/.ssh/id_ed25519.pub
fi

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        echo "Found linux-gnu"
	ssh-add ~/.ssh/id_ed25519
        pbcopy < ~/.ssh/id_ed25519.pub
fi

if [[ "$OSTYPE" == "win32" ]]; then
        echo "Found win32"
	ssh-add ~/.ssh/id_ed25519
        clip < ~/.ssh/id_ed25519.pub
fi

