#!/usr/bin/env sh

PLUGINS_DIR="$HOME/.config/sketchybar/plugins"

sketchybar --add item clock right --set clock \
  update_freq=10 \
  icon.drawing=off \
  label.color=0xff1b1b1b \
  background.padding_right=4 \
  background.color=0xffa9b665 \
  background.drawing=on \
  background.corner_radius=12 \
  script="$PLUGINS_DIR/clock_script.sh"
