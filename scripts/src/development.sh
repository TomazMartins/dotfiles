#!/usr/bin/env bash

# ==============================================================================
#                                   DEVELOPMENT
# ==============================================================================
print_divider

# APT Packges      =============================================================
install_apt git


# SNAP Packages    =============================================================
install_snap dbeaver-ce
install_snap ngrok
# install_snap docker
install_snap postman
install_snap aws-cli
install_snap kubectl
install_snap heroku
install_snap slack


# Complex Packages =============================================================
ROOTDIR=$(dirname "$0")

source $ROOTDIR/scripts/src/progs/vscode.sh

print_divider
echo ''
