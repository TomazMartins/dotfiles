#!/usr/bin/env bash

# ==============================================================================
#                                       VSCODE
# ==============================================================================
ROOTDIR=$(dirname "$0")
application='code'

# Functions ====================================================================
function install() {
  install_snap code
}

function plugin() {
  operation='Configure'
  print_message $application $operation 'Adding plugin to VS Code'
  name=$1

  sudo -u zamott code --install-extension ${name} --force >> /dev/null 2>&1

  print_ok $application $operation "Plugin ${name} is installed"
}

function configure() {
  operation='Configure'

  which bin/snap/code >> /dev/null 2>&1

  if [ ${?} -ne 0 ]; then
    origin_keybindings=$ROOTDIR/dots/configs/vscode/keybindings.json
    origin_settings=$ROOTDIR/dots/configs/vscode/settings.json
    destiny=${HOME}/.config/Code/User/

    copy $application $operation $origin_keybindings $destiny
    copy $application $operation $origin_settings $destiny

    plugin evgeniypetukhov.dark-low-contrast
    plugin miguel-savignano.ruby-symbols
    plugin ms-vscode.atom-keybindings
    plugin ms-azuretools.vscode-docker
    plugin hbenl.vscode-test-explorer
    plugin pkief.material-icon-theme
    plugin donjayamanne.githistory
    plugin naumovs.color-highlight
    plugin dbaeumer.vscode-eslint
    plugin attilabuti.vscode-mjml
    plugin stevejpurves.cucumber
    plugin trixnz.go-to-method
    plugin yzane.markdown-pdf
    plugin eamodio.gitlens
    plugin rid9.datetime
    plugin groksrc.ruby
  else
    print_error $application $operation 'VS Code doesnt found'
  fi
}

function vscode() {
  install
  configure
}


# RUN!     ====================================================================
vscode
