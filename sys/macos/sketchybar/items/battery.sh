#!/usr/bin/env sh

PLUGINS_DIR="$HOME/.config/sketchybar/plugins"

sketchybar --add item battery right \
		   --set battery icon.drawing=off \
						 label.highlight_color=0xff88ff88 \
						 update_freq=10 \
						 script="$PLUGINS_DIR/battery_script.sh" \
		   --subscribe battery system_woke
