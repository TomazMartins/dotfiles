#!/usr/bin/env bash

# ==============================================================================
#                                   SYSTEM
# ==============================================================================
# Aux function =================================================================
function upgrade_system() {
  operation="Upgrade"
  application=$1

  print_message $application $operation "Upgrading sytem..."
  apt upgrade -y >> /dev/null 2>&1
  print_ok $application $operation "System upgraded"
}

function update_system() {
  operation="Update"
  application=$1

  print_message $application $operation "Updating sytem..."
  apt update -y >> /dev/null 2>&1
  print_ok $application $operation "Sytem updated"
}

function cleanup_system() {
  operation="Cleanup"
  application=$1

  print_message $application $operation "Cleanup sytem..."
  apt autoremove -y >> /dev/null 2>&1
  print_ok $application $operation "Sytem cleaned"
}


# Main function ================================================================
function system() {
  application=$1

  print_divider
  print_message $application $application "Doing some actions to prepare to install/config with dotfiles"

  update_system $application
  upgrade_system $application
  cleanup_system $application

  print_divider
  echo ''
}


# RUN! ========================================================================
system "SYSTEM"