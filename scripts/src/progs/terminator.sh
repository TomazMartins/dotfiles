#!/usr/bin/env bash

# ==============================================================================
#                                       VSCODE
# ==============================================================================
ROOTDIR=$(dirname "$0")
application='code'

# Functions ====================================================================
function install() {
  install_apt terminator
}

function configure() {
  operation='Configure'

  origin_path=$ROOTDIR/dots/configs/terminator/config
  destiny_path=${HOME}/.config/terminator

  if [ ! -d $destiny_path ]; then
    mkdir $destiny_path >> /dev/null 2>&1
  fi

  copy $application $operation $origin_path $destiny_path
}

function terminator() {
  install
  configure
}


# RUN!     ====================================================================
terminator
