#!/bin/sh

xrdb merge ~/.Xresources
xrandr --output HDMI-0 --auto --left-of eDP-1-1
brightnessctl -d 'intel_backlight' set 80%
# compton &
xset r rate 200 50 &
picom &

wal &
fetch &

~/.config/chadwm/scripts/bar &

while type dwm >/dev/null; do dwm && continue || break; done
