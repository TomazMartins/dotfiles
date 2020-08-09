#!/usr/bin/env bash

BASEDIR=$(dirname "$0")

# AUX Functions ==================================================
source $BASEDIR/scripts/aux/colors.sh
source $BASEDIR/scripts/aux/print.sh
source $BASEDIR/scripts/aux/snaps.sh
source $BASEDIR/scripts/aux/apts.sh

print_divider
print_message 'DOTFILE' 'WELCOME' 'Welcome to the dotfiles install/configuration central'
print_message 'DOTFILE' 'WELCOME' 'Now, we will start the process. Please, atempt to the prompt'
print_divider
echo ''

# SRC Scripts   ==================================================
source $BASEDIR/scripts/src/system.sh
source $BASEDIR/scripts/src/entertainment.sh
source $BASEDIR/scripts/src/development.sh
source $BASEDIR/scripts/src/utilities.sh
