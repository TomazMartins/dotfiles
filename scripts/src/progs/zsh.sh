#!/usr/bin/env bash

# ==============================================================================
#                                   ZSH
# ==============================================================================
application='code'
ROOTDIR=$1

# Functions ====================================================================
function install_oh_my_zsh() {
  operation='Install'

  print_message $application $operation 'Getting script to install OhMyZsh'

  sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  sed -i s'/exec zsh -l/#####/'g install.sh

  print_ok $application $operation 'Got script'
  print_message $application $operation 'Installing OhMyZsh'

  sh install.sh
  rm -rfv install.sh

  print_ok $application $operation 'OhMyZsh installed'
}

function install_power_line() {
  install_apt fonts-powerline
}

function install_zsh() {
  install_apt zsh
}

function configure_zsh() {
  operation='Configure'

  print_message $application $operation 'Changing shell default'
  chsh -s /bin/zsh
  print_ok $application $operation 'Changed shell default'
}

function zsh() {
  install_power_line
  install_zsh
  configure_zsh

  install_oh_my_zsh

  link_home $application $operation $ROOTDIR/dots/configs/zsh/.zshrc
}


# RUN!     ====================================================================
zsh