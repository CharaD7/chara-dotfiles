#!/bin/sh

# Stop on errors
set -e

# Make a base path
basePath='~/chara-dotfiles/'
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

echo "Checking for git installation..."
gitPath=$(which git)

# Checking to see if git path is registered
if [ $gitPath 2> /dev/null -eq "" ]; then
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

echo "Installing NerdFonts..."
cp -r NerdFonts/* ~/.local/share/fonts/

# Install fish terminal
configFish &

# Install tmux
configTmux &

# Install bubbly on user request
read -p "Would you like to install the bubbly chat widget now? [Y,n]: " -i Y bubblyReply
if [ $bubblesReply -eq "y" || $bubblyReply -eq "Y" ]; then
  configBubbly &
else
  echo "Skipping bubbly installation..."
fi

# Configure neovim on user request
read -p "Would you like to configure the neovim IDE now? [Y,n]: " -i Y nvimReply
if [ $nvimReply -eq "y" || $nvimReply -eq "Y" ]; then
  configNvim &
else
  echo "Skipping neovide installation..."
fi

echo "Last step!"
# Install dwm
configDwm &
