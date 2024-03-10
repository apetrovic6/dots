#!/bin/bash

# Check for updates using zypper
update_info=$(zypper lu)

# Count the number of lines that represent updates, subtracting the header lines
update_count=$(echo "$update_info" | grep '|' | wc -l)
let update_count=update_count # Adjust this based on the actual output

# Output for Waybar
echo "$update_count  " 

