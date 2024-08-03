#!/bin/sh

userName=$(echo $USER)

xrdb merge ~/.Xresources

# use `xrandr --query` to show available monitors
xrandr --output HDMI-1 --auto --left-of eDP-1

xpad -h &

chown $userName:$userName /sys/class/backlight/intel_backlight/brightness
# compton &
xset r rate 200 50 &
picom &

~/.config/chadwm/scripts/wal &
dunst & # Add notification daemon to startup

~/.config/chadwm/scripts/bar &
dwm 2> ~/dwm.log

while type dwm >/dev/null; do dwm && continue || break; done
