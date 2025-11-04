#!/bin/bash

# Check if Spotify is running and currently playing music
if [ "$(playerctl --player=spotify status 2>/dev/null)" = "Playing" ]; then
    playerctl --player=spotify metadata --format ' {{ artist }} - {{ title }}'
elif [ "$(playerctl --player=spotify status 2>/dev/null)" = "Paused" ]; then
    echo "󰏤: $(playerctl --player=spotify metadata --format '{{ artist }} - {{ title }}')"
else
    # Output nothing or a custom message if Spotify is stopped or not found
    echo "Awfully quiet in here"
fi
