#!/usr/bin/env bash

# ==============================================================================
#                                   ZSH
# ==============================================================================
ROOTDIR=$(dirname "$0")
application='zsh'

# Functions ====================================================================
function install_oh_my_zsh() {
  operation='Install'

  print_message $application $operation 'Installing OhMyZsh'

  OHZSHDIR=$HOME/.oh-my-zsh

  if [ ! -d $OHZSHDIR ]; then
    git clone https://github.com/robbyrussell/oh-my-zsh.git $OHZSHDIR \
      >> /dev/null 2>&1

    print_ok $application $operation 'OhMyZsh installed'
  else
    print_message $application $operation 'OhMyZsh is already installed'
  fi
}

function install_zsh() {
  install_apt zsh
}

function install_fonts-powerline() {
  sudo apt install fonts-powerline
}

function configure_theme_powelevel10k_zsh() {
  operation='Configure'

  print_message $application $operation 'Configuring zsh theme: POWERLEVEL10K'

  ZSH_THEME_DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

  if [ ! -d "$ZSH_THEME_DIR" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
      ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k \
      >> /dev/null 2>&1

    print_ok $application $operation 'POWERLEVEl10K is your theme now'
  else
    print_message $application $operation 'POWERLEVEl10K is already installed'
  fi
}

function configure_zsh_syntax_highlighting() {
  operation='Configure'

  print_message $application $operation 'Configuring zsh plugin: zsh_syntax_highlighting'

  ZSHSYNTAXDIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

  if [ ! -d "$ZSHSYNTAXDIR" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
      ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting \
      >> /dev/null 2>&1

    print_ok $application $operation 'zsh_syntax_highlighting is installed'
  else
    print_message $application $operation 'zsh_syntax_highlighting is already installed'
  fi
}

function zsh() {
  install_zsh 
  install_oh_my_zsh
  configure_theme_powelevel10k_zsh
  configure_zsh_syntax_highlighting

  copy_home $application $operation $ROOTDIR/dots/home/zsh/.zshrc

  chsh -s $(which zsh)
}


# RUN!     ====================================================================
zsh