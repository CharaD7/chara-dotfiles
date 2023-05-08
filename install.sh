#!/bin/sh

# do a global system update
echo "Running system update"
sudo apt update && sudo apt upgrade

# Install prerequisites for Dynamic Window Manager (dwm)
echo "Installing prerequisites"
sudo apt install libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-dpms0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl-dev libegl-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev meson
sudo apt install build-essential libx11-dev libxinerama-dev sharutils suckless-tools libxft-dev stterm git

# Install dwm
echo "Installing dwm"
sudo apt install dwm

# Install gitconfig with alias
read -p "Would you like to setup your gitconfig now? [Y,n]: " -i Y gitConfigReply
if [ "$gitConfigReply" = "y" || "$gitConfigReply" = "Y" ]; then
  read -r "Enter your git username: " gitUsername
  read -r "Enter your git email address: " gitEmail

  git config --global user.name "$gitUsername"
  git config --global user.email "$gitEmail"

else
  echo "Skipping git configuration. Kindly configure your git after installation process"
fi

alias g=git
sleep 1
echo "Your git command is now aliased 'g'"
