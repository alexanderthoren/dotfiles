#!/usr/bin/env sh

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10")
for i in "${!SPACE_ICONS[@]}"
do
  sid=$(($i+1))
  sketchybar --add space space.$sid center \
             --set space.$sid associated_space=$sid \
							  icon.drawing=off \
                              label=${SPACE_ICONS[i]} \
							  label.color=0xffffffff \
							  label.highlight_color=0x77ffffff \
							  label.highlight=off \
                              background.padding_left=2 \
                              background.padding_right=2 \
                              background.color=0x44ffffff \
                              background.corner_radius=4 \
                              background.height=22 \
                              background.drawing=on \
                              script="$PLUGIN_DIR/space.sh" \
                              click_script="yabai -m space --focus $sid"
done
