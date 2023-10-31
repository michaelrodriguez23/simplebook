#!/bin/bash
source "$HOME/simplebook/config/bookmark_config"

xdotool search --sync --onlyvisible --limit 1 --classname browser windowactivate
sleep 0.3
xdotool key Ctrl+l 
sleep 0.3
xdotool key Ctrl+c

bookmark="$(xclip -o)"

if grep -q "^$bookmark$" "$bookmarks_file"; then
    notify-send "Oops." "Already bookmarked!"
else
    if [[ "$bookmark" == https* || "$bookmark" == www* ]]; then 
        notify-send "Bookmark added!" "$bookmark is now saved."
        echo "$bookmark" >> "$bookmarks_file"
    else 
        notify-send "Oops." "Invalid Selection."
    fi
fi
