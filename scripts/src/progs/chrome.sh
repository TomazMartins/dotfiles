#!/usr/bin/env bash

# ==============================================================================
#                                 CHROME
# ==============================================================================
ROOTDIR=$(dirname "$0")
application='google-chrome'

# Functions ====================================================================
function install_chrome() {
  operation='Install'

  print_message $application $operation 'Installing google-chrome'

  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    >> /dev/null 2>&1

  destiny_file=/usr/bin/google-chrome

  dpkg -i google-chrome-stable_current_amd64.deb >> /dev/null 2>&1
  rm -rf google-chrome-stable_current_amd64.deb >> /dev/null 2>&1

  if [ -f $destiny_file ]; then
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