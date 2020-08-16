#!/usr/bin/env bash

# ==============================================================================
#                                       VSCODE
# ==============================================================================
ROOTDIR=$(dirname "$0")
application='code'

# Functions ====================================================================
function install() {
  install_apt temrinator
}

function configure() {
  operation='Configure'

  prigin_path=$ROOTDIR/dots/configs/terminator/config
  destiny_path=${HOME}/.config/terminator

  mkdir $destiny_path
  copy $application $operation $origin_ath $destiny_path
}

function terminator() {
  install
  configure
}


# RUN!     ====================================================================
terminator
