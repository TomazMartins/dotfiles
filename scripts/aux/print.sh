#!/usr/bin/env bash

# ==============================================================================
#                                PRINT FUNCTIONS
# ==============================================================================
function print_divider() {
  echo -e "${BC}========================================${NONE}"
  sleep 0.25
}

function print_message() {
  echo -e "${BB}[MSGS] [${BC}${1}${BB}] [${2}]:\t${NONE}\t${3}"
  sleep 0.25
}

function print_ok() {
  echo -e "${BG}[ OK ] [${BC}${1}${BG}] [${2}]:\t${G}\t${3}${NONE}"
  sleep 0.25
}

function print_warning() {
  echo -e "${BY}[WARN] [${BC}${1}${BY}] [${2}]:\t${NONE}\t${3}"
  sleep 0.25
}

function print_error() {
  echo -e "${BR}[ERRO] [${BC}${1}${BR}] [${2}]:\t${R}\t${3}${NONE}"
  sleep 0.25
}
