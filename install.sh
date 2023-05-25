#!/bin/bash

# Stop on errors
set -e

# Make a base path
userHome=$(echo $HOME)
basePath="$userHome/chara-dotfiles"
mkdir -p $basePath && cd $basePath

# do a global system update
echo "Running system update..."
sudo apt update -y && sudo apt upgrade -y

echo "Checking for git installation..."

# Checking to see if git path is registered
case "$( which git 2> /dev/null)" in
  "")
    echo "Git not detected, installing git..."
    sudo apt install -y git;;
esac

# Clone the repository
git clone https://github.com/CharaD7/chara-dotfiles.git .

# .gitconfig setup function
setGitConfig () {

  # Ask to use repo's gitconfig
  read -p "Would you like to use repo's gitconfig aliases? [Y,n]: " -i Y gitAliases
  if [ $gitAliases -eq "y" || $gitAliases -eq "Y" ]; then
    # Configure git
    cp -r .gitconfig $userHome/.gitconfig

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

  sleep 1

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

  # Checking to see if path is registered
  case "$( which unzip 2> /dev/null)" in
    "") sudo apt install -y unzip;;
  esac

  unzip exa.zip && mv exa/ $userHome/exa/
  cd $userHome/exa/
  cargo build --release
  sudo cp -r target/release/exa /usr/bin/exa

  echo "Copying fish configuration files to $fishPath..."
  cd $basePath
  cp -rf fish/ $fishPath
}

# Tmux terminal config setup function
setTmuxConfig() {
  echo "Installing tmux essentials..."
  sudo apt install -y python3 python3-pip powerline

  echo "Installing tmux"
  sudo apt install -y tmux

  echo "Copying config files for tmux powerline setup..."
  sudo cp -r powerline-config /usr/bin/powerline-config
  cp -r .tmux.conf $userHome/.tmux.conf
  cp -r .tmux.powerline.conf $userHome/.tmux.powerline.conf

  echo "Running powerline-config to setup tmux..."
  source $userHome/.tmux.conf

  echo "Setting system default shell to tmux"
  sudo chsh -s $(which tmux)
}

# Bubbly config setup function
setBubblyConfig() {
  # Install bubbly on user request
  read -p "Would you like to install the bubbly chat widget now? [Y,n]: " -i Y bubblyReply
  if [ $bubblesReply -eq "y" || $bubblyReply -eq "Y" ]; then
    # Copy local content to ~/.loca/share/
    echo "Setting up bubbly..."

    mkdir -p $userHome/.local/share/bubbly
    echo "Copying bubbly files to respective directories"
    cp -r bubbles/local/* $userHome/.local/share/bubbly/

    mkdir -p $userHome/.config/bubbly
    cp -r bubbles/config/* $userHome/.config/bubbly/

    # Register desktop application
    echo "Registering desktop bubbly application"
    cp -r bubbles/bubbly.desktop $userHome/.local/share/applications/

    sleep 1

    echo "Setup will now attempt to add you as member of the video group to allow you change screen brightness using the dashboard."
    # Ask to accept adding to video group
    read -p "Would you like setup to add you ro video group? [Y,n]: " -i Y videoResult
    if [ $videoResult -eq "y" || $videoResult -eq "Y" ]; then
      # Add the user
      sudo gpasswd video -a $(whoami)

      # Add backlight rule to '/etc/udev/rules/' path
      sudo cp -r backlight.rules /etc/udev/rules.d/backlight.rules

      echo "User added. Setup will now continue with the remaining steps."
    fi

  else
    echo "Skipping bubbly installation..."
  fi

}

# Neovide config setup function
setNeovideConfig() {
  # Configure neovim on user request
  read -p "Would you like to configure the neovim IDE now? [Y,n]: " -i Y nvimReply
  if [ $nvimReply -eq "y" || $nvimReply -eq "Y" ]; then
    # Install nvim if it does not exist
    echo "Checking for nvim installation..."
    nvimPath=$(which nvim)

    # Checking to see if nvim path is registered
    if [ $nvimPath 2> /dev/null -eq "" ]; then
      echo "Nvim not detected, installing nvim..."
      sudo apt install -y nvim
    fi

    # Copy neovim files to ~/.config/nvim
    nvimPath="$userHome/.config/nvim/"
    mkdir -p $nvimPath
    echo "Copying neovim files to $nvimPath..."
    cp -r nvim/* $nvimPath

    # Ask to install neovide
    read -p "Would you like to install NEOVIDE now? [Y,n]: " -i Y neovideReply
    if [ $neovideReply -eq "y" || $neovideReply -eq "Y" ]; then
      # Install neovide
      echo "Installing prerequisites..."
      sudo apt install -y curl \
          gnupg ca-certificates git \
          gcc-multilib g++-multilib cmake libssl-dev pkg-config \
          libfreetype6-dev libasound2-dev libexpat1-dev libxcb-composite0-dev \
          libbz2-dev libsndio-dev freeglut3-dev libxmu-dev libxi-dev libfontconfig1-dev \
          libxcursor-dev

      # Use cargo to install neovide
      cargo install --git https://github.com/neovide/neovide
    fi

  else
    echo "Skipping neovide installation..."
  fi
}

# DWM config setup function
setDWMConfig() {
  echo "Last step!"
  # Install dwm

  # Install prerequisites for Dynamic Window Manager (dwm)
  echo "Installing prerequisites for dwm..."
  sudo apt install -y libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-dpms0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl-dev libegl-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev meson
  sudo apt install -y build-essential libx11-dev libxinerama-dev sharutils suckless-tools libxft-dev stterm curl

  # Installing other tools
  echo "Installing other necessary tools"
  sudo apt install -y picom feh acpi rofi brightnessctl

  echo "Installing dwm..."
  sudo apt install -y dwm

  echo "Copying necessary files"
  cp -r eww/ $userHome/.config/eww/
  cp -r picom/ $userHome/.config/picom/
  cp -r rofi/ $userHome/.config/rofi/
  cp -r dwm/ $userHome/.config/dwm/

  slockInstalled=$(which slock)

  if [ $slockInstalled 2> /dev/null -eq "" ]; then
    echo "Installing slock"
    sudo apt install slock
  fi

  # Copy the desktop session call to xsessions
  sudo cp -r dwm.desktop /usr/share/xsessions/dwm.desktop

  xrdb merge $userHome/.config/dwm/.Xresources

  # Copy background pictures to the Pictures folder
  mkdir -p $userHome/Pictures/wall

  picturesDir="$userHome/Pictures/wall/"
  echo "Copying wallpapers to $picturesDir"
  cp -r wall/ $picturesDir

  # Compile dwm files
  echo "Compiling dwm configuration"
  cd $userHome/.config/dwm/ && sudo make install

  echo "Compile done"
  # Ask to restart
  read -p "Would you like to reboot now? [Y,n]: " -i Y rebootResult
  if [ $rebootResult -eq "y" || $rebootResult -eq "Y" ]; then
    # Reboot system
    sudo reboot
  fi

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

# Do bubbly config task
setBubblyConfig

# Do neovide config task
setNeovideConfig

# Do dwm config task
setDWMConfig
