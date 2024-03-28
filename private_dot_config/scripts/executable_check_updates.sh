#!/bin/bash

# Check for updates using zypper
update_info=$(zypper lu)

# Count the number of lines that represent updates, adjusting for accurate counting
zypper_update_count=$(echo "$update_info" | grep -E 'v |v$' | wc -l)

# Check for Flatpak updates
flatpak_update_info=$(flatpak remote-ls --updates)
flatpak_update_count=$(echo "$flatpak_update_info" | grep -v '^Ref' | wc -l)

# Calculate total updates
total_updates=$((zypper_update_count + flatpak_update_count -1))


# Output for Waybar
echo "$total_updates " 

