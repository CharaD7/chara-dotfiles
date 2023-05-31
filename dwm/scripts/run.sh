#!/bin/sh

xrdb merge ~/.Xresources
xrandr --output HDMI-0 --auto --left-of eDP-1-1
# compton &
xset r rate 200 50 &
picom &

wal &
fetch &

~/.config/dwm/scripts/bar &

while type dwm >/dev/null; do dwm && continue || break; done
