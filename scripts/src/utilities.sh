#!/usr/bin/env bash

# ==============================================================================
#                                   UTILITIES
# ==============================================================================
ROOTDIR=$1

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
BASEDIR=$(dirname "$0")

source $BASEDIR/progs/zsh.sh $ROOTDIR