#!/usr/bin/env sh

PLUGINS_DIR="$HOME/.config/sketchybar/plugins"

sketchybar --add item frontapp left --set frontapp \
  icon.drawing=off \
  label.color=0xff1b1b1b \
  background.padding_left=4 \
  background.color=0xff89b482 \
  background.drawing=on \
  background.corner_radius=12 \
  script="$PLUGINS_DIR/frontapp_script.sh" \
  --subscribe frontapp front_app_switched
