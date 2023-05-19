#!/bin/sh

userName=$(echo $USER)

xrdb merge ~/.Xresources
xrandr --output HDMI-0 --auto --left-of eDP-1-1
sudo chown $userName:$userName /sys/class/backlight/intel_backlight/brightness
# compton &
xset r rate 200 50 &
picom &

wal &
fetch &

~/.config/chadwm/scripts/bar &

while type dwm >/dev/null; do dwm && continue || break; done
