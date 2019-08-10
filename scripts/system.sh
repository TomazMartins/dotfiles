#!/usr/bin/env bash

# ==============================================================================
#                           AUX FUNCTIONS
# ==============================================================================
function upgrade_system()
{
  sudo apt upgrade -y
}

function configure_desktop()
{
  gsettings set org.gnome.desktop.wm.preferences button-layout 'close,maximize,minimize:'
  gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
  gsettings set org.gnome.desktop.datetime automatic-timezone true
  gsettings set org.gnome.desktop.interface clock-show-date true
  gsettings set org.gnome.desktop.interface clock-show-weekday true
  gsettings set org.gnome.desktop.interface show-battery-percentage true
  gsettings set org.gnome.desktop.peripherals.touchpad click-method 'fingers'
  gsettings set org.gnome.desktop.peripherals.touchpad disable-while-typing true
  gsettings set org.gnome.desktop.peripherals.touchpad scroll-method 'two-finger-scrolling'
  gsettings set org.gnome.desktop.search-providers disable-external false
  gsettings set org.gnome.desktop.screensaver picture-uri 'PATH'
}

function configure_gedit()
{
  gsettings set org.gnome.gedit.preferences.editor auto-indent true
  gsettings set org.gnome.gedit.preferences.editor bracket-matching true
  gsettings set org.gnome.gedit.preferences.editor display-line-numbers true
  gsettings set org.gnome.gedit.preferences.editor display-right-margin true
  gsettings set org.gnome.gedit.preferences.editor highlight-current-line true
  gsettings set org.gnome.gedit.preferences.editor insert-spaces true
  gsettings set org.gnome.gedit.preferences.editor scheme tango
  gsettings set org.gnome.gedit.preferences.editor tabs-size 2
}

function configure_zsh()
{
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
  sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
  wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
  sudo apt-get update
  sudo apt-get install google-chrome-stable
}

function configure_gnome_extensions()
{
  sudo apt install chrome-gnome-shell
  sudo apt install gnome-shell-extensions
}

function install_dependences()
{
  sudo apt install apt-transport-https
  sudo apt install ubuntu-restricted-extras
  sudo apt install snapd
}

function install_customize_system_apps()
{
  sudo apt install gnome-tweaks -y
  sudo apt install dconf-tools -y
}


# ==============================================================================
#                           MAIN FUNCTION
# ==============================================================================
function main_system()
{
}