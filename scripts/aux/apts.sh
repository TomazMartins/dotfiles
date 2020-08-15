#!/usr/bin/env bash

# ==============================================================================
#                              APT INSTALLATIONS
# ==============================================================================
# BEGIN Messages ===============================================================
function message_apt_ok() {
  application=$1
  operation="Install"
  message="Package ${C}$application${NONE} was successfully installed"

  print_ok $application $operation "$message"
}

function message_apt() {
  application=$1
  operation="Install"
  message="$2"

  print_message $application $operation "$message"
}

function message_apt_error() {
  application=$1
  operation="Install"
  message="Package ${C}$application${NONE} doesn't exist or occurs some error"

  print_error $application $operation "$message"
}
# END Messages =================================================================


# Main function ================================================================
function install_apt() {
  application=${1}

  message_apt $application "Installing ${C}${application}${NONE}"
  which $application >> /dev/null 2>&1

  if [ ${?} -ne 0 ]; then
    apt install -y $application >> /dev/null 2>&1
    which $application >> /dev/null 2>&1

    if [ ${?} -eq 0 ]; then
      message_apt_ok $application
    else
      message_apt_error $application
    fi
  else
    message_apt $application "Package ${C}$application${NONE} is already installed" 
  fi
}
