#!/usr/bin/env bash

BASEDIR=$(dirname "$0")

source $BASEDIR/colors.sh


# ==================== VARIABLES ====================
CHEFDK_NAME="chefdk_3.8.14-1_amd64.deb"

CHEFDK_PKG_UBUNTU_18="https://packages.chef.io/files/stable/chefdk/3.8.14/ubuntu/18.04/${CHEFDK_NAME}"
CHEFDK_PKG_UBUNTU_16="https://packages.chef.io/files/stable/chefdk/3.8.14/ubuntu/16.04/${CHEFDK_NAME}"
CHEFDK_PKG_UBUNTU_14="https://packages.chef.io/files/stable/chefdk/3.8.14/ubuntu/14.04/${CHEFDK_NAME}"

SHA256_UBUNTU_18="83b96eb28891d3f89d58c3ffefa61c0d8aa605911c3b90d8c5cb92a75602e56d"
SHA256_UBUNTU_16="83b96eb28891d3f89d58c3ffefa61c0d8aa605911c3b90d8c5cb92a75602e56d"
SHA256_UBUNTU_14="83b96eb28891d3f89d58c3ffefa61c0d8aa605911c3b90d8c5cb92a75602e56d"


# ==================== MAIN COMMANDS ====================
# Creates directory Downloads
if [ -d "~/Downloads" ]
then
  echo "${BG}Directory ~/Downloads exists.${NONE}"
else
  mkdir ~/Downloads
  echo "${BG}Directory ~/Downloads was created.${NONE}"
fi

# Download ChefDK
echo "${BG}Downloading ChefDK...${NONE}"
wget -P ~/Downloads ${CHEFDK_PKG_UBUNTU_18}

# Install ChefDK
echo "${BG}Installing ChefDK...${NONE}"
sudo dpkg -i ~/Downloads/${CHEFDK_NAME}

# Remove package ChefDK
echo "${BG}Removing ChefDK...${NONE}"
rm ~/Downloads/${CHEFDK_NAME}

# Check ChefDK Version
echo "${BG}ChefDk Version:${NONE}"
chef --version


# ===== REMOVE AFTER TESTS =====
cp -rf /vagrant/cookbooks ./
cp -rf /vagrant/client.rb ./


# Install Workstation with Chef!
sudo chef-client -c $PWD/client.rb --local-mode --runlist 'workstation'
