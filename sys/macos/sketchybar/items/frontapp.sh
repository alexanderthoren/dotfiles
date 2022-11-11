#!/usr/bin/env sh

PLUGINS_DIR="$HOME/.config/sketchybar/plugins"

sketchybar --add item frontapp left \
		   --set frontapp icon.drawing=off \
						  script="$PLUGINS_DIR/frontapp_script.sh" \
		   --subscribe frontapp front_app_switched
