#!/bin/sh

# Stop on errors
set -e

# Make a base path
basePath = '~/chara-dotfiles/'
mkdir -p $basePath

echo "Copying directory contents to $basePath"
# Copy all files except .git
cp -rf * -A | grep -v '.git' $basePath && cd $basePath

# .gitconfig setup function
setGitConfig () {
  cp -r .gitconfig ~/.gitconfig

  alias g=git
  sleep 1
  echo "Your git command is now aliased 'g'"
  echo "You can run 'g cn' to check your global git username and 'g ce' to check your global git email address."
}

# do a global system update
echo "Running system update..."
sudo apt update && sudo apt upgrade

# Install prerequisites for Dynamic Window Manager (dwm)
echo "Installing prerequisites..."
sudo apt install libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-dpms0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl-dev libegl-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev meson
sudo apt install build-essential libx11-dev libxinerama-dev sharutils suckless-tools libxft-dev stterm curl

echo "Checking for git installation..."
gitPath = $(which git)

# Checking to see if git path is registered
if [ $gitPath -ne "/usr/bin/git" ]; then
  echo "Git not detected, installing git..."
  sudo apt install git
fi

# Ask to use repo's gitconfig
read -p "Would you like to use repo's gitconfig aliases? [Y,n]: " -i Y gitAliases
if [ $gitAliases -eq "y" || $gitAliases -eq "Y" ]; then
  # Copy git aliases
  setGitConfig
fi

# Setting up gitconfig with alias
read -p "Would you like to setup your gitconfig now? [Y,n]: " -i Y gitConfigReply
if [ $gitConfigReply -eq "y" || $gitConfigReply -eq "Y" ]; then
  # Configure git
  configGit &
else
  echo "Skipping git configuration. Kindly configure your git after installation process..."
fi

# Install fish terminal
configFish &

# Install dwm
echo "Installing dwm..."
sudo apt install dwm
