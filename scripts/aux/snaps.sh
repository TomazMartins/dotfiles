#!/usr/bin/env bash

# ==============================================================================
#                                     SNAPS
# ==============================================================================

# BEGIN Messages ===============================================================
function message_ok() {
  application=$1
  operation="Install"
  message="Snap ${C}$application${NONE} was successfully installed"

  print_ok $application $operation "$message"
}

function message() {
  application=$1
  operation="Install"
  message="$2"

  print_message $application $operation "$message"
}

function message_warning() {
  application=$1
  operation="Install"
  message="Snap ${C}$application${NONE} doesn't exist. I will try with classic option..."

  print_message $application $operation "$message"
}

function message_error() {
  application=$1
  operation="Install"
  message="Snap ${C}$application${NONE} doesn't exist or occurs some error"

  print_error $application $operation "$message"
}
# END Messages =================================================================


# Main function ================================================================
function install_snap() {
  application=${1}

  message $application "Installing ${C}${application}${NONE}"
  which $application >> /dev/null 2>&1

  if [ ${?} -ne 0 ]; then
    sudo snap install $application >> /dev/null 2>&1
    which $application >> /dev/null 2>&1

    if [ ${?} -eq 0 ]; then
      message_ok $application
    else
      message_warning $application

      sudo snap install $application --classic >> /dev/null 2>&1
      which $application >> /dev/null 2>&1

      if [ ${?} -eq 0 ]; then
        message_ok $application
      else
        message_error $application
      fi
    fi
  else
    message $application "Snap ${C}$application${NONE} is already installed" 
  fi
}