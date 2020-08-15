#!/usr/bin/env bash

# ==============================================================================
#                                SYNC FUNCTION
# ==============================================================================
function link() {
  print_message $1 $2 "Linking ${3} to ${4}"

  ln -sf $3 $4

  if [ -L ${3} ]; then
    print_ok $1 $2 "Linked ${3} to ${4}"
  else
    print_error $1 $2 "${3} wasnt linked to ${4}"
  fi
}

function copy() {
  print_message $1 $2 "Copying ${3} to ${4}"

  cp $3 $4

  if [ -f ${3} ]; then
    print_ok $1 $2 "Copied ${3} to ${4}"
  else
    print_error $1 $2 "${3} wasnt copied to ${4}"
  fi
}

function link_home() {
  link $1 $2 $3 ${HOME}
}

function copy_home() {
  copy $1 $2 $3 ${HOME}
}