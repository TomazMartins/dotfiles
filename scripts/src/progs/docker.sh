#!/usr/bin/env bash

# ==============================================================================
#                                 DOCKER
# ==============================================================================
ROOTDIR=$(dirname "$0")
application='docker'

# Functions ====================================================================
function install_docker() {
  install_snap docker
}

function install_docker_compose() {
  sudo curl -L \
    "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" \
    -o /usr/local/bin/docker-compose \
    >> /dev/null 2>&1

  sudo chmod +x /usr/local/bin/docker-compose >> /dev/null 2>&1
}


function docker() {
  install_docker
  install_docker_compose
}


# RUN!     ====================================================================
docker