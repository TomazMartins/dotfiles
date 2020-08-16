#!/usr/bin/env bash

# ==============================================================================
#                                   UTILITIES
# ==============================================================================
print_divider

# APT Packges      =============================================================
install_apt curl
install_apt tree
install_apt wget

# SNAP Packages    =============================================================
install_snap gimp
# install_snap onlyoffice-desktopeditors
install_snap telegram-desktop
install_snap htmldoc
install_snap skype

# Complex Packages =============================================================
ROOTDIR=$(dirname "$0")

source $ROOTDIR/scripts/src/progs/chrome.sh
source $ROOTDIR/scripts/src/progs/terminator.sh
source $ROOTDIR/scripts/src/progs/zsh.sh

print_divider
echo ''
