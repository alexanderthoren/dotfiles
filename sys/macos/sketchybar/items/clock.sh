#!/usr/bin/env sh

PLUGINS_DIR="$HOME/.config/sketchybar/plugins"

sketchybar --add item clock right \
		   --set clock update_freq=10 \
					   script="$PLUGINS_DIR/clock_script.sh"
