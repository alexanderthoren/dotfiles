#!/bin/sh

echo "-> Full installation"
macos_path=sys/macos/
(
source "$macos_path"files.sh &
source "$macos_path"brew.sh
)
wait
echo "<- Full installation completed!"
