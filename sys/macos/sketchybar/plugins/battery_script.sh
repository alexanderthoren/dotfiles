#!/usr/bin/env sh

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ $PERCENTAGE = "" ]; then
  exit 0
fi

sketchybar --set $NAME label="${PERCENTAGE}%" \
				       label.highlight=on

if [[ $CHARGING != "" ]]; then
  sketchybar --set $NAME label.highlight=on
fi

