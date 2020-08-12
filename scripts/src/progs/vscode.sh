#!/usr/bin/env bash

# ==============================================================================
#                                       VSCODE
# ==============================================================================
application='code'
ROOTDIR=$1

# Functions ====================================================================
function install() {
  install_snap code
}

function plugin() {
  print_message $application 'Configure' 'Adding plugin to VS Code'
  name="${1}"

  code --install-extension ${name} --force
}

function configure() {
  operation='Configure'
  which code >> /dev/null 2>&1

  if [ ${?} -ne 0 ]; then
    link $application $operation $ROOTDIR/dots/configs/vscode/keybindings.json
    link $application $operation $ROOTDIR/dots/configs/vscode/settings.json

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
