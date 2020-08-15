#!/usr/bin/env bash

# ==============================================================================
#                                   ZSH
# ==============================================================================
ROOTDIR=$(dirname "$0")
application='code'

# Functions ====================================================================
function install_oh_my_zsh() {
  operation='Install'

  print_message $application $operation 'Installing OhMyZsh'

  OHZSHDIR=$HOME/.oh-my-zsh

  if [ ! -d $OHZSHDIR ]; then
    git clone https://github.com/robbyrussell/oh-my-zsh.git $OHZSHDIR
    print_ok $application $operation 'OhMyZsh installed'
  else
    print_message $application $operation 'OhMyZsh is already installed'
  fi
}

function install_zsh() {
  install_apt zsh
}

function configure_theme_powelevel10k_zsh() {
  operation='Configure'

  print_message $application $operation 'Configuring zsh theme: POWERLEVEL10K'

  ZSH_THEME_DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

  if [ ! -d "$ZSH_THEME_DIR" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    print_ok $application $operation 'POWERLEVEl10K is your theme now'
  else
    print_message $application $operation 'POWERLEVEl10K is already installed'
  fi
}

function zsh() {
  install_zsh 
  install_oh_my_zsh
  configure_theme_powelevel10k_zsh

  copy_home $application $operation $ROOTDIR/dots/configs/zsh/.zshrc
}


# RUN!     ====================================================================
zsh