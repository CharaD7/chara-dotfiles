#!/bin/sh

# Stop on errors
set -e

# Get the current focused window
window_id=$(xdotool getactivewindow)

# Toggle the menu bar
xdotool windowactive $window_id key Alt+space
