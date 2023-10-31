#!/bin/bash
source "$HOME/simplebook/config/bookmark_config"

# Search Functionality 
selected_bookmark=$(grep -oP '^.+' "$bookmarks_file" | rofi -dmenu -p "Search Bookmarks: " -matching fuzzy)

# Check if a bookmark was selected
if [[ -n "$selected_bookmark" ]]; then
    xdotool search --sync --onlyvisible --limit 1 --classname browser windowactivate 
    xdotool key Ctrl+l
    sleep 0.1
    xdotool type "$selected_bookmark"
    xdotool key Return
fi
