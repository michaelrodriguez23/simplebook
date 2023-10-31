#!/bin/bash

# Give execute permissions
chmod +x ~/simplebook/src/*.sh

# Create bookmark file if doesn't exist
touch ~/simplebook_bookmarks.txt

# Install necessary dependencies
sudo pacman -Sy rofi xdotool xclip --noconfirm || sudo apt install rofi xdotool xclip -y

# Hotkey setup
cat <<EOF > ~/.xbindkeysrc
# simplebook hotkeys
"$HOME/simplebook/src/search_bookmark.sh"
    Mod1 + z

"$HOME/simplebook/src/add_bookmark.sh"
    Mod1 + b
EOF

# Reload xbindkeys to recognize the new hotkeys
pkill xbindkeys
xbindkeys
