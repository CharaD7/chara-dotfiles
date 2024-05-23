#!/bin/bash

# Stop on errors
set -e

# Make a base path
user=$(echo $USER)
userHome=$(echo $HOME)
basePath="$userHome/chara-dotfiles"
mkdir -p $basePath && cd $basePath

# Adding user to sudoers
sudo usermod -aG sudo $user

# do a global system update
echo "Running system update..."
sudo apt update -y && sudo apt upgrade -y

echo "Checking for git installation..."

# Checking to see if git path is registered
case "$(which git 2> /dev/null)" in
  "")
    echo "Git not detected, installing git..."
    sudo apt install -y git;;
  "/usr/bin/git") echo "Git already installed, moving to the next step...";;
esac

# Clone the repository
git clone https://github.com/CharaD7/chara-dotfiles.git .

# .gitconfig setup function
setGitConfig () {

  echo "Installing prerequisites..."
  sudo apt install -y curl \
      gnupg ca-certificates \
      gcc-multilib g++-multilib cmake libssl-dev pkg-config \
      libfreetype6-dev libasound2-dev libexpat1-dev libxcb-composite0-dev \
      libbz2-dev libsndio-dev freeglut3-dev libxmu-dev libxi-dev libfontconfig1-dev \
      libxcursor-dev dunst

echo "Prepping dunst configuration"
cp -rf dunst $userHome/.config/

  # Ask to use repo's gitconfig
  read -p "Would you like to use repo's gitconfig aliases? [Y,n]: " gitAliases
  if [ "$gitAliases" == "y" ] || [ "$gitAliases" == "Y" ]; then
    # Configure git
    cp -r .gitconfig $userHome/.gitconfig

    alias g=git
    sleep 1
  fi

  # Setting up gitconfig with alias
  read -p "Would you like to setup your gitconfig now? [Y,n]: " gitConfigReply
  if [ "$gitConfigReply" == "y" ] || [ "$gitConfigReply" == "Y" ]; then
    # Configure git
    read -p "Enter your git username: " gitUsername
    read -p "Enter your git email address: " gitEmail

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
  mkdir -p $fishPath

  echo "Installing fish shell..."
  sudo apt install fish -y
  curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | bash

  sleep 1

  echo "Installing prerequisites for exa..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  echo "Adding cargo bin path to environment variables"
  export PATH="$userHome/.cargo/bin:$PATH"

  sleep 1

  echo "Checking system path for wget..."
  case "$( which wget 2> /dev/null )" in
    "") sudo apt install wget -y;;
    "/usr/bin/wget") echo "wget installed, moving to the next step...";;
  esac
  wget https://github.com/ogham/exa/archive/master.zip
  mv master.zip exa.zip

  sleep 1

  echo 'Checking for unzip install path'
  # Checking to see if path is registered
  case "$( which unzip 2> /dev/null)" in
    "") sudo apt install -y unzip;;
    "/usr/bin/unzip") echo "Unzip already installed, moving to the next step...";;
  esac

  exaHome="$userHome/exa/"
  mkdir -p $exaHome

  unzip exa.zip -d $exaHome
  cd $exaHome/exa-master/

  cargo build --release
  sudo cp -r target/release/exa /usr/bin/exa

  echo "Copying fish configuration files to $fishPath..."
  cd $basePath
  cp -rf fish/* $fishPath
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

  echo "Setting system default shell to tmux"
  sudo chsh -s $(which tmux)
}

# Bubbly config setup function
setBubblyConfig() {
  # Install bubbly on user request
  read -p "Would you like to install the bubbly chat widget now? [Y,n]: " bubblyReply
  if [ "$bubblyReply" == "y" ] || [ "$bubblyReply" == "Y" ]; then
    # Copy local content to ~/.loca/share/
    echo "Setting up bubbly..."

    bubblyDir="$userHome/.local/share/bubbly/"
    mkdir -p $bubblyDir

    echo "Copying bubbly files to respective directories"
    cp -r bubbles/local/* $bubblyDir

    bubblyHome="$userHome/.config/bubbly/"
    mkdir -p $bubblyHome
    cp -r bubbles/config/* $bubblyHome

    # Register desktop application
    echo "Registering desktop bubbly application"
    cp -r bubbles/bubbly.desktop $userHome/.local/share/applications/

    sleep 1

    echo "Setup will now attempt to add you as member of the video group to allow you change screen brightness using the dashboard."
    # Ask to accept adding to video group
    read -p "Would you like setup to add you to video group? [Y,n]: " videoResult
    if [ "$videoResult" == "y" ] || [ "$videoResult" == "Y" ]; then
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


# Neovim installation
installNeovim() {
	cd $userHome/Downloads/
	
	sleep 1
	
	# Download the image file
	echo "Downloading neovim image..."
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
	chmod u+x nvim.appimage
	
	sleep 1
	
	# Exctract the files
	echo "Extracting the image file"
	./nvim.appimage --appimage-extract
	
	# Exposing the executable globally
	echo "Moving and registering Neovim globally..."
	sudo mv squashfs-root /
	sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
	
	if [ "$( nvim --version 2> /dev/null )" != "" ]; then
		echo "Done."
		
		sleep 1
		
		echo "Moving to the next step..."
		
		cd $basePath
	else
		echo "There was a problem installing neovim"
	fi
}

# Neovide config setup function
setNeovideConfig() {
  # Configure neovim on user request
  read -p "Would you like to configure the neovim IDE now? [Y,n]: " nvimReply
  if [ "$nvimReply" == "y" ] || [ "$nvimReply" == "Y" ]; then

    sleep 1

    # Install nvim if it does not exist
    echo "Checking for nvim installation..."
    # Checking to see if nvim path is registered
    if [ "$(which nvim)" == "" ]; then
        echo "Nvim not detected, installing nvim..."
        installNeovim
    else
    	# Check nvim version
    	nvimVersion=$(nvim --version | head -1 | grep -o '[0-9]\.[0-9]')
    	
     	if (( $(echo "$nvimVersion < 0.9 " |bc -l) )); then
        echo "Unsupported version installed. Removing version and installing a supported version"
        sudo apt remove -y neovim
        installNeovim
      else
      	echo "Nvim version 0.9 or greater is installed. Moving to the next step."
      fi
    fi

    # Copy neovim files to ~/.config/nvim
    nvimPath="$userHome/.config/nvim/"
    mkdir -p $nvimPath
    echo "Copying neovim files to $nvimPath..."
    cp -r nvim/* $nvimPath

    # Ask to install neovide
    read -p "Would you like to install NEOVIDE now? [Y,n]: " neovideReply
    if [ "$neovideReply" == "y" ] || [ "$neovideReply" == "Y" ]; then
      # Install neovide
      cd $userHome/Downloads
      wget https://github.com/neovide/neovide/releases/latest/download/neovide.tar.gz
      tar zxf neovide.tar.gz
      sudo cp -r neovide /usr/bin/neovide
      rm -r neovide.tar.gz

      cd $basePath
    fi

  else
    echo "Skipping neovide installation..."
  fi
}

# DWM config setup function
setDWMConfig() {

  sleep 1

  echo "Last step!"
  # Install dwm

  sleep 1

  # Install prerequisites for Dynamic Window Manager (dwm)
  echo "Installing prerequisites for dwm..."
  sudo apt install -y libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-dpms0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl-dev libegl-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev meson
  sudo apt install -y build-essential libx11-dev libxinerama-dev sharutils suckless-tools libxft-dev stterm curl libimlib2-dev

  sleep 1

  # Installing other tools
  echo "Installing other necessary tools"
  sudo apt install -y picom feh acpi rofi brightnessctl

  sleep 1

  echo "Installing dwm..."
  sudo apt install -y dwm

  sleep 1

  echo "Copying necessary files"
  ewwHome="$userHome/.config/eww/"
  mkdir -p $ewwHome
  cp -r eww/ $ewwHome

  picomHome="$userHome/.config/picom/"
  mkdir -p $picomHome
  cp -r picom/ $picomHome

  rofiHome="$userHome/.config/rofi/"
  mkdir -p $rofiHome
  cp -r rofi/ $rofiHome

  dwmHome="$userHome/.config/dwm/"
  mkdir -p $dwmHome
  cp -r dwm/ $dwmHome

  slockInstalled=$(which slock)

  # Checking to see if slock path is registered
  if [ "$($slockInstalled 2> /dev/null)" == "" ]; then
      echo "slock not detected, installing slock..."
      sudo apt install -y slock
  else
    echo "slock already installed, moving to the next step...";;
  fi

  # Copy the desktop session call to xsessions
  sudo cp -r dwm.desktop /usr/share/xsessions/dwm.desktop

  # Copy background pictures to the Pictures folder
  picHome="$userHome/Pictures/wall/"
  mkdir -p $picomHome

  sleep 1

  echo "Copying wallpapers to $picHome"
  cp -r wall/* $picHome/

  # Compile dwm files
  echo "Compiling dwm configuration"
  cd $dwmHome/dwm && sudo make install

  xrdb merge $dwmHome/.Xresources

  sleep 1

  echo "Compile done"
  # Ask to restart
  read -p "Would you like to reboot now? [Y,n]: " rebootResult
  if [ "$rebootResult" == "y" ] || [ "$rebootResult" == "Y" ]; then
    # Reboot system
    sudo reboot
  fi

}

# Do git config task
setGitConfig

# Do NerdFont installation task
echo "Installing NerdFonts..."
nerdFontHome="$userHome/.local/share/fonts"
mkdir -p $nerdFontHome
cp -r NerdFonts/* $nerdFontHome

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
