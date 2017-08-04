#!/bin/bash

# Specifying the icon(s) in the script
# This allows us to change its appearance conditionally
icon=" >"

player_status=$(playerctl status 2> /dev/null)
if [[ $? -eq 0 ]]; then
    metadata="$(playerctl metadata artist) - $(playerctl metadata title)"
fi

# Foreground color formatting tags are optional
if [[ $player_status = "Playing" ]]; then
    echo "%{F#7baa14}$icon $metadata"       # Green when playing
elif [[ $player_status = "Paused" ]]; then
    echo "%{F#8a8a8a}$icon $metadata"       # Greyed out info when paused
fi
