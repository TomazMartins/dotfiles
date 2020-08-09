#!/usr/bin/env bash

# ==============================================================================
#                                       VSCODE
# ==============================================================================
# Functions ====================================================================
function install() {
  install_snap code
}

function plugin() {
  name="${1}"
  code --install-extension ${name} --force
}

funcion configure() {
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
}

function vscode() {
  install
  configure
}


# RUN!     ====================================================================
vscode
