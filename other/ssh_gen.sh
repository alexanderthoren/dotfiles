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

if [ "$(uname)" == "Darwin" ]; then
	ssh-add -K ~/.ssh/id_ed25519
	pbcopy < ~/.ssh/id_ed25519.pub
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	ssh-add ~/.ssh/id_ed25519
	pbcopy < ~/.ssh/id_ed25519.pub
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
	ssh-add ~/.ssh/id_ed25519
	clip < ~/.ssh/id_ed25519.pub
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
	ssh-add ~/.ssh/id_ed25519
	clip < ~/.ssh/id_ed25519.pub
fi

