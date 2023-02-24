#!/bin/bash

# Get the current song information from ncmpcpp
title=$(ncmpcpp --current-song "%t")

# Send a desktop notification using notify-send
dunstify -i /usr/share/icons/custom/music.png  "Now Playing" "$title"

