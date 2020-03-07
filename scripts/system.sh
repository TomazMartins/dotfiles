#!/usr/bin/env bash

# ==============================================================================
#                                 VARIABLES
# ==============================================================================
MODULE_NAME="System Module"


# ==============================================================================
#                                 FUNCTIONS
# ==============================================================================
function print_message
{
  printf "$BG["$G"OK"$BG"]\t[%s]\u2015[$G%-25s$BG] [%s] $NONE\r" "$MODULE_NAME" "$1" "$2"
}

function print_final_message
{
  printf "$BG[OK]\t[%s]\u2015[%-25s] [%s] $NONE" "$MODULE_NAME" "$1" "$2"
}


# ==============================================================================
#                               AUX FUNCTIONS
# ==============================================================================
function upgrade_system()
{
  print_message "Updating System..." "0%"

  sudo apt upgrade -y >> /dev/null 2>&1
}

function configure_desktop()
{
  print_message "Configuring Desktop..." "12.5%"

  gsettings set org.gnome.desktop.wm.preferences button-layout 'close,maximize,minimize:' >> /dev/null 2>&1
  gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true >> /dev/null 2>&1
  gsettings set org.gnome.desktop.datetime automatic-timezone true >> /dev/null 2>&1
  gsettings set org.gnome.desktop.interface clock-show-date true >> /dev/null 2>&1
  gsettings set org.gnome.desktop.interface clock-show-weekday true >> /dev/null 2>&1
  gsettings set org.gnome.desktop.interface show-battery-percentage true >> /dev/null 2>&1
  gsettings set org.gnome.desktop.peripherals.touchpad click-method 'fingers' >> /dev/null 2>&1
  gsettings set org.gnome.desktop.peripherals.touchpad disable-while-typing true >> /dev/null 2>&1
  gsettings set org.gnome.desktop.peripherals.touchpad scroll-method 'two-finger-scrolling' >> /dev/null 2>&1
  gsettings set org.gnome.desktop.search-providers disable-external false >> /dev/null 2>&1
  gsettings set org.gnome.desktop.screensaver picture-uri 'PATH' >> /dev/null 2>&1
}

function configure_gedit()
{
  print_message "Configuring gedit..." "25.0%"

  gsettings set org.gnome.gedit.preferences.editor auto-indent true >> /dev/null 2>&1
  gsettings set org.gnome.gedit.preferences.editor bracket-matching true >> /dev/null 2>&1
  gsettings set org.gnome.gedit.preferences.editor display-line-numbers true >> /dev/null 2>&1
  gsettings set org.gnome.gedit.preferences.editor display-right-margin true >> /dev/null 2>&1
  gsettings set org.gnome.gedit.preferences.editor highlight-current-line true >> /dev/null 2>&1
  gsettings set org.gnome.gedit.preferences.editor insert-spaces true >> /dev/null 2>&1
  gsettings set org.gnome.gedit.preferences.editor scheme tango >> /dev/null 2>&1
  gsettings set org.gnome.gedit.preferences.editor tabs-size 2 >> /dev/null 2>&1
}

function configure_zsh()
{
  print_message "Configuring zsh..." "37.5%"

  sudo apt install git-core zsh
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  sudo apt install fonts-powerline
  git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
  chsh -s $(which zsh)
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting\n

  source .zshrc
}

function configure_google_chrome()
{
  print_message "Configuring gedit..." "50.0%"

  sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
  wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
  sudo apt-get update
  sudo apt-get install google-chrome-stable
}

function configure_gnome_extensions()
{
  print_message "Configuring gedit..." "62.5%"

  sudo apt install chrome-gnome-shell
  sudo apt install gnome-shell-extensions
}

function install_dependences()
{
  print_message "Configuring gedit..." "75.0%"

  sudo apt install apt-transport-https
  sudo apt install ubuntu-restricted-extras
  sudo apt install snapd
}

function install_customize_system_apps()
{
  print_message "Configuring gedit..." "87.5%"

  sudo apt install gnome-tweaks -y
  sudo apt install dconf-tools -y
}


# ==============================================================================
#                             MAIN FUNCTION
# ==============================================================================
function main_system()
{
  upgrade_system
  configure_desktop
  configure_gedit

  print_final_message "DONE" "100.0%"
}

# =============================== RUN ==========================================
main_system