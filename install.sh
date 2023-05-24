#!/bin/bash

# Stop on errors
set -e

# Make a base path
userHome=$(echo $HOME)
basePath="$userHome/chara-dotfiles"
mkdir -p $basePath && cd $basePath

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

# Clone the repository
git clone https://github.com/CharaD7/chara-dotfiles.git .

# .gitconfig setup function
setGitConfig () {

  # Ask to use repo's gitconfig
  read -p "Would you like to use repo's gitconfig aliases? [Y,n]: " -i Y gitAliases
  if [ $gitAliases -eq "y" || $gitAliases -eq "Y" ]; then
    # Setting up gitconfig with alias
    cp -r .gitconfig ~/.gitconfig

    alias g=git
    sleep 1
  fi

  # Setting up gitconfig with alias
  read -p "Would you like to setup your gitconfig now? [Y,n]: " -i Y gitConfigReply
  if [ $gitConfigReply -eq "y" || $gitConfigReply -eq "Y" ]; then
  # Configure git
    read -r "Enter your git username: " gitUsername
    read -r "Enter your git email address: " gitEmail

    echo "Setting your global git username to '$gitUsername'"
    git config --global user.name "$gitUsername"
    echo "Setting your global git email to '$gitEmail'"
    git config --global user.email "$gitEmail"
  fi

  sleep 1
  echo "Your git command is now aliased 'g'"
  echo "You can run 'g cn' to check your global git username and 'g ce' to check your global git email address."

}

# Fish terminal config setup function
setFishConfig() {
  fishPath="$userHome/.config/fish/"

  echo "Installing fish shell..."
  curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

  echo "Setting up fish terminal..."
  omf install z peco
  omf theme bobthefish

  echo "Installing fisher, fish's plugin manager..."
  curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
  fisher install x-motemen/ghq

  sleep 1

  echo "Installing prerequisites for exa..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  echo "Adding cargo bin path to environment variables"
  export PATH="$userHome/.cargo/bin:$PATH"

  curl https://github.com/ogham/exa/archive/master.zip
  mv master.zip exa.zip
  echo 'Checking for unzip install path'
  unzipPath=$(which unzip)

  # Checking to see if path is registered
  if [ $unzipPath 2> /dev/null -eq "" ]; then
    sudo apt install -y unzip
  fi

  unzip exa.zip && mv exa/ $userHome/exa/
  cd $userHome/exa/
  cargo build --release
  sudo cp -r target/release/exa /usr/bin/exa

  echo "Copying fish configuration files to ~/.config/fish..."
  cd $basePath
  cp -rf fish/ $fishPath
}

# Tmux terminal config setup function
setTmuxConfig() {
  echo "Installing tmux essentials..."
  sudo apt install -y python3 python3-pip powerline

  echo "Installing tmux"
  sudo apt install tmux

  echo "Copying config files for tmux powerline setup..."
  sudo cp -r powerline-config /usr/bin/powerline-config
  cp -r .tmux.conf $userHome/.tmux.conf
  cp -r .tmux.powerline.conf $userHome/.tmux.powerline.conf

  echo "Running powerline-config to setup tmux..."
  source $userHome/.tmux.conf

  echo "Setting system default shell to tmux"
  sudo chsh -s (which tmux)
}


# Do git config task
setGitConfig

# Do NerdFont installation task
echo "Installing NerdFonts..."
cp -r NerdFonts/* $userHome/.local/share/fonts/

# Do fish config task
setFishConfig

# Do tmux config task
setTmuxConfig

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
