#!/bin/sh

userName=$(echo $USER)

xrdb merge ~/.Xresources
xrandr --output HDMI-0 --auto --left-of eDP-1-1

xpad -h &

chown $userName:$userName /sys/class/backlight/intel_backlight/brightness
# compton &
xset r rate 200 50 &
picom &

wal &
dunst & # Add notification daemon to startup

~/.config/chadwm/scripts/bar &
dwm 2> ~/dwm.log

while type dwm >/dev/null; do dwm && continue || break; done
