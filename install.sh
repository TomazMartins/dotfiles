#!/usr/bin/env bash

ROOTDIR=$(dirname "$0")

# AUX Functions ==================================================
source $ROOTDIR/scripts/aux/colors.sh
source $ROOTDIR/scripts/aux/print.sh
source $ROOTDIR/scripts/aux/syncs.sh
source $ROOTDIR/scripts/aux/snaps.sh
source $ROOTDIR/scripts/aux/apts.sh

print_divider
print_message 'DOTFILE' 'WELCOME' 'Welcome to the dotfiles install/configuration central'
print_message 'DOTFILE' 'WELCOME' 'Now, we will start the process. Please, atempt to the prompt'
print_divider
echo ''

# SRC Scripts   ==================================================
source $ROOTDIR/scripts/src/system.sh
source $ROOTDIR/scripts/src/entertainment.sh
source $ROOTDIR/scripts/src/development.sh
source $ROOTDIR/scripts/src/utilities.sh
