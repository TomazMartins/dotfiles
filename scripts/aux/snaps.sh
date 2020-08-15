#!/usr/bin/env bash

# ==============================================================================
#                                     SNAPS
# ==============================================================================

# BEGIN Messages ===============================================================
function message_snap_ok() {
  application=$1
  operation="Install"
  message="Snap ${C}$application${NONE} was successfully installed"

  print_ok $application $operation "$message"
}

function message_snap() {
  application=$1
  operation="Install"
  message="$2"

  print_message $application $operation "$message"
}

function message_snap_warning() {
  application=$1
  operation="Install"
  message="Snap ${C}$application${NONE} doesn't exist. I will try with classic option..."

  print_message $application $operation "$message"
}

function message_snap_error() {
  application=$1
  operation="Install"
  message="Snap ${C}$application${NONE} doesn't exist or occurs some error"

  print_error $application $operation "$message"
}
# END Messages =================================================================


# Main function ================================================================
function install_snap() {
  application=${1}

  message_snap $application "Installing ${C}${application}${NONE}"
  which $application >> /dev/null 2>&1

  if [ ${?} -ne 0 ]; then
    snap install $application >> /dev/null 2>&1
    which $application >> /dev/null 2>&1

    if [ ${?} -eq 0 ]; then
      message_snap_ok $application
    else
      message_snap_warning $application

      snap install $application --classic >> /dev/null 2>&1
      which $application >> /dev/null 2>&1

      if [ ${?} -eq 0 ]; then
        message_snap_ok $application
      else
        message_snap_error $application
      fi
    fi
  else
    message_snap $application "Snap ${C}$application${NONE} is already installed" 
  fi
}
