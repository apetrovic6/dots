#!/bin/bash

# This script will randomly go through the files of a directory, setting it
# up as the wallpaper at regular intervals
#
# NOTE: this script is in bash (not posix shell), because the RANDOM variable
# we use is not defined in posix

if [[ $# -lt 1 ]] || [[ ! -d $1 ]]; then
	echo "Usage:
	$0 <dir containing images>"
	exit 1
fi

# Edit below to control the images transition
export SWWW_TRANSITION_FPS=120
export SWWW_TRANSITION_STEP=2
export SWWW_TRANSITION="any"
export SWWW_TRANSITION_DURATION=3

# This controls (in seconds) when to switch to the next image
INTERVAL=600

while true; do
	find "$1" -type f |
		while read -r img; do
			echo "$((RANDOM % 1000)):$img"
		done |
		sort -n | cut -d':' -f2- |
		while read -r img; do
			sleep 3
			swww img "$img"
			sleep 2
			wal -i "$img"
			$HOME/.config/waybar/launch.sh &
			sleep $INTERVAL
		done
done
