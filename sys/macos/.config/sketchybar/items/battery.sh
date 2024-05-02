#!/usr/bin/env sh

PLUGINS_DIR="$HOME/.config/sketchybar/plugins"

sketchybar --add item battery right --set battery \
  icon.drawing=off \
  update_freq=10 \
  script="$PLUGINS_DIR/battery_script.sh" \
  label.color=0xff1b1b1b \
  background.color=0xffd8a657 \
  background.drawing=on \
  background.corner_radius=12 \
  --subscribe battery system_woke
