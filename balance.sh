#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Yabai balance windows
# @raycast.mode silent
#
# Optional parameters:
# @raycast.icon images/yabai.png
# @raycast.iconDark images/yabai.png

yabai -m space --balance
echo "Balancing windows"
