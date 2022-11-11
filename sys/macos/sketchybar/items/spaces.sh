#!/usr/bin/env sh

PLUGINS_DIR="$HOME/.config/sketchybar/plugins"

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10")
for i in "${!SPACE_ICONS[@]}"
do
  sid=$(($i+1))
  sketchybar --add space space.$sid left \
             --set space.$sid associated_space=$sid \
							  icon.drawing=off \
                              label=${SPACE_ICONS[i]} \
							  label.color=0x55ffffff \
							  label.highlight_color=0xffffffff \
                              background.padding_left=2 \
                              background.padding_right=2 \
                              background.color=0x44ffffff \
                              background.corner_radius=4 \
                              background.height=22 \
                              background.drawing=on \
                              script="$PLUGINS_DIR/space_script.sh" \
                              click_script="yabai -m space --focus $sid"
done
