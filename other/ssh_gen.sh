#!/bin/sh

ssh-keygen -t ed25519 -C "$1"

eval "$(ssh-agent -s)"

rm ~/.ssh/config

touch ~/.ssh/config

echo "Host *" >> ~/.ssh/config
echo "  AddKeysToAgent yes" >> ~/.ssh/config
echo "  UseKeychain yes" >> ~/.ssh/config
echo "  IdentityFile ~/.ssh/id_ed25519" >> ~/.ssh/config

ssh-add -K ~/.ssh/id_ed25519

pbcopy < ~/.ssh/id_ed25519.pub
