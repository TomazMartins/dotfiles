#!/usr/bin/env bash

gpg --keyserver #{keyserver} --recv-keys #{recv_keys}
curl -sSL https://get.rvm.io | bash -s stable


sudo apt-get remove --purge openjdk-*
sudo add-apt-repository #{java_repository} -y
sudo apt update
echo debconf shared/accepted-oracle-license-v1-2 select true | \
sudo /usr/bin/debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-2 seen true | \
sudo /usr/bin/debconf-set-selections
oracle-java#{java_version}-installer -y


sudo snap install android-studio --classic
sudo snap install postgresql10


sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt update
sudo apt install g++-7 -y


wget #{virtual_box_package_url} -P ~/Downloads
sudo dpkg -i ~/Downloads/#{virtual_box_package_name}
sudo apt-get install -y -f
rm -rf ~/Downloads/#{virtual_box_package_name}


wget #{vagrant_package_url} -P ~/Downloads
sudo dpkg -i ~/Downloads/#{vagrant_package_name}
sudo apt-get install -y -f
rm -rf ~/Downloads/#{vagrant_package_name}


sudo apt-get install  -y apt-transport-https ca-certificates curl gnupg software-properties-common
curl -fsSL #{docker_gpg_url} | sudo apt-key add -
sudo add-apt-repository 'deb [arch=amd64] #{docker_base_url} #{docker_ubuntu_version} stable'
sudo apt-get update
sudo apt-get install docker-ce -y


sudo curl -L "https://github.com/docker/compose/releases/download/#{docker_compose_version}/docker-compose-$(uname -s)-$(uname -m)" -o #{docker_compose_path}
sudo chmod +x #{docker_compose_path}


sudo snap install heroku --classic
sudo snap install postman
sudo snap install cmake --classic
sudo snap install eclipse --classic
sudo snap install code --classic

code --install-extensions ms-vscode.atom-keybindings
code --install-extensions ms-azuretools.vscode-docker
code --install-extensions dbaeumer.vscode-eslint
code --install-extensions ms-vsliveshare.vsliveshare
code --install-extensions yzane.markdown-pdf
code --install-extensions bierner.markdown-preview-github-styles
code --install-extensions rid9.datetime
code --install-extensions shyykoserhiy.vscode-spotify
code --install-extensions naumovs.color-highlight