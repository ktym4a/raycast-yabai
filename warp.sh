#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Yabai warp active window to other space
# @raycast.mode silent
#
# Optional parameters:
# @raycast.currentDirectoryPath ~
# @raycast.argument1 { "type": "text", "placeholder": "space label" }
# @raycast.icon images/yabai.png
# @raycast.iconDark images/yabai.png

spaceLabel=$1
targetSpaceId=$(yabai -m query --spaces | jq '.[] | select(."label" == "'$spaceLabel'").id')

if [ -z "$targetSpaceId" ]; then
  echo "Cannot find space with name $spaceLabel"
  exit 0
fi

windowId=$(yabai -m query --windows | jq '.[] | select(."has-focus" == true).id')
yabai -m window --space $spaceLabel
yabai -m window --focus $windowId

echo "Warping window to space $spaceLabel"
