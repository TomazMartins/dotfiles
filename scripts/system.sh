#!/usr/bin/env bash

sudo apt update -y
sudo apt upgrade -y

sudo apt install apt-transport-https
sudo apt install ubuntu-restricted-extras
sudo apt install snapd

sudo apt install gnome-tweaks -y
sudo apt install dconf-tools -y

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

gsettings set org.gnome.gedit.preferences.editor auto-indent true
gsettings set org.gnome.gedit.preferences.editor bracket-matching true
gsettings set org.gnome.gedit.preferences.editor display-line-numbers true
gsettings set org.gnome.gedit.preferences.editor display-right-margin true
gsettings set org.gnome.gedit.preferences.editor highlight-current-line true
gsettings set org.gnome.gedit.preferences.editor insert-spaces true
gsettings set org.gnome.gedit.preferences.editor scheme tango
gsettings set org.gnome.gedit.preferences.editor tabs-size 2

sudo apt install chrome-gnome-shell
sudo apt install gnome-shell-extensions


sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt-get update
sudo apt-get install google-chrome-stable


sudo apt install git-core zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo apt install fonts-powerline
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
chsh -s $(which zsh)
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting\n
source .zshrc