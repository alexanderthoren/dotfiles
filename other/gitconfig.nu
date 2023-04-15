#!/usr/bin/env nu

let home = $env.HOME

echo "Installing new .gitconfig..."
cp sys/shared/.home/.gitconfig $home
echo "Installation completed!"
