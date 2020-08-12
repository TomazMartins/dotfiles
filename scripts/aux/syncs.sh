#!/usr/bin/env bash

# ==============================================================================
#                                SYNC FUNCTION
# ==============================================================================
function link() {
  print_message $1 $2 "Linking ${3} to ${HOME}"

  ln -sf $3 ${HOME}

  if [ -L ${3} ]; then
    print_ok $1 $2 "Linked ${3} to ${HOME}"
  else
    print_error $1 $2 "${3} wasnt linked to ${HOME}"
  fi
}

function copy() {
  print_message $1 $2 "Copying ${3} to ${HOME}"

  cp $1 ${HOME}

  if [ -f ${3} ]; then
    print_ok $1 $2 "Copied ${3} to ${HOME}"
  else
    print_error $1 $2 "${3} wasnt copied to ${HOME}"
  fi
}