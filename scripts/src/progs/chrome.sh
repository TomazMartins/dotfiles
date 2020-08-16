#!/usr/bin/env bash

# ==============================================================================
#                                 CHROME
# ==============================================================================
ROOTDIR=$(dirname "$0")
application='google-chrome'

# Functions ====================================================================
function install_chrome() {
  operation='Install'

  print_message $application $operation

  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    >> /dev/null 2>&1
  dpkg -i google-chrome-stable_current_amd64.deb >> /dev/null 2>&1

  which google-chrome >> /dev/null 2>&1

  if [ ${?} -ne 0 ]; then
    rm -rf google-chrome-stable_current_amd64.deb >> /dev/null 2>&1
    print_ok $application $operation 'google-chrome is installed'
  else
    print_error $application $operation 'google-chrome doesnt found'
  fi
}


function chrome() {
  install_chrome
}


# RUN!     ====================================================================
chrome