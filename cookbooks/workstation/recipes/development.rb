# =============================================================================
# RUBY
# =============================================================================
keyserver = node[:development][:rvm][:keyserver]
recv_keys = node[:development][:rvm][:recv_keys]
username = node[:personal][:user][:name]
home = node[:system][:home]

is_install_rvm = node[:development][:rvm][:install]

group 'rvm' do
  members [username, 'root']
  append true
end

execute 'Add: Public Key' do
  command "gpg --keyserver #{keyserver} --recv-keys #{recv_keys}"
  environment 'USER' => username, 'HOME' => home
  user username
  group 'rvm'
  retries 3
  cwd home

  not_if 'which rvm'
end

execute 'Install: rvm' do
  command '\curl -sSL https://get.rvm.io | bash -s stable'
  cwd home
  environment 'USER' => username, 'HOME' => home
  group 'rvm'
  user username
  not_if 'which rvm'
end

bash 'Adds: rvm command' do
  user 'root'
  cwd home

  code <<-EOH
    if [ $(which zsh) ]
    then
      source ~/.zshrc
      echo 'zsh sourced'
    else
      source ~/.bashrc
      echo 'bash sourced'
    fi
  EOH
end


# =============================================================================
# JAVA
# =============================================================================
is_install_java = node[:development][:java][:install]

java_repository = node[:development][:java][:repository][:ppa]
java_version = node[:development][:java][:version]

user_name = node[:personal][:user][:name]
user_home = node[:system][:home]


group 'java' do
  members [user_name, 'root']
  append true

  only_if { is_install_java }
end

execute 'Remove: OpenJDK' do
  command 'sudo apt-get remove --purge openjdk-*'

  only_if { is_install_java }
end

execute 'Add: Java Repository' do
  command "sudo add-apt-repository #{java_repository} -y"

  only_if { is_install_java }
end

execute 'Update: All Packages' do
  command 'sudo apt update'

  only_if { is_install_java }
end

execute 'Add: Allow Acceptance Java License' do
  command <<-EOH
    echo debconf shared/accepted-oracle-license-v1-2 select true | \
    sudo /usr/bin/debconf-set-selections
    echo debconf shared/accepted-oracle-license-v1-2 seen true | \
    sudo /usr/bin/debconf-set-selections
  EOH

  only_if { is_install_java }
end

package 'Install: Java' do
  package_name "oracle-java#{java_version}-installer"
  options '--force-yes'
  
  action :install
  only_if { is_install_java }
end


# =============================================================================
# ANDROID
# =============================================================================
is_install_android = node[:development][:android][:install]

execute 'Install: android studio' do
  command 'sudo snap install android-studio --classic'
  action :run

  only_if { is_install_java && is_install_android }
end


# =============================================================================
# C++
# =============================================================================
is_install_cpp = node[:development][:cpp][:install]

execute 'Install: dependencies' do
  command <<-EOH
    sudo apt-get install -y software-properties-common
    sudo add-apt-repository ppa:ubuntu-toolchain-r/test
  EOH
  action :run

  only_if { is_install_cpp }
end


execute 'Update: System' do
  command 'sudo apt update'
  action :run

  only_if { is_install_cpp }
end


execute 'Install: g++-7' do
  command 'sudo apt install g++-7 -y'
  action :run

  only_if { is_install_cpp }
end


execute 'Setup: g++-7' do
  command <<-EOH
    sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 60 \
                        --slave /usr/bin/g++ g++ /usr/bin/g++-7 \
                        --slave /usr/bin/gcc-ar gcc-ar /usr/bin/gcc-ar-7 \
                        --slave /usr/bin/gcc-nm gcc-nm /usr/bin/gcc-nm-7 \
                        --slave /usr/bin/gcc-ranlib gcc-ranlib /usr/bin/gcc-ranlib-7
    sudo update-alternatives --config gcc
    gcc --version
    g++ --version
  EOH
  action :run

  only_if { is_install_cpp }
end

# =============================================================================
# DATABASES
# =============================================================================
is_install_postgres = node[:development][:databases][:postgres][:install]
postgres_version = node[:development][:databases][:postgres][:version]

execute "Install: postgres #{postgres_version}" do
  command 'sudo snap install postgresql10'
  action :run

  only_if { is_install_postgres }
end


# =============================================================================
# VIRTUALIZATION
# =============================================================================
# -------------------------------- VIRTUAL BOX --------------------------------
virtual_box_package_name = node[:development][:virtualization][:virtual_box][:ubuntu][:package][:name]
virtual_box_package_url = node[:development][:virtualization][:virtual_box][:ubuntu][:package][:url]
virtual_box_version = node[:development][:virtualization][:virtual_box][:version]

is_install_virtual_box = node[:development][:virtualization][:virtual_box][:install]

execute "Download: virtual box  version #{virtual_box_version}" do
  command "wget #{virtual_box_package_url} -P ~/Downloads"
  action :run

  only_if { is_install_virtual_box }
end

execute "Install: virtual box version #{virtual_box_version}" do
  command <<-EOH
    sudo dpkg -i ~/Downloads/#{virtual_box_package_name}
    sudo apt-get install -y -f
  EOH
  action :run

  only_if { is_install_virtual_box }
end

execute 'Remove: virtual box\'s package' do
  command "rm -rf ~/Downloads/#{virtual_box_package_name}"
  action :run

  only_if { is_install_virtual_box }
end


# ---------------------------------- VAGRANT ----------------------------------
vagrant_package_name = node[:development][:virtualization][:vagrant][:ubuntu][:package][:name]
vagrant_package_url = node[:development][:virtualization][:vagrant][:ubuntu][:package][:url]
vagrant_version = node[:development][:virtualization][:vagrant][:version]

is_install_vagrant = node[:development][:virtualization][:vagrant][:install]

execute "Download: vagrant  version #{vagrant_version}" do
  command "wget #{vagrant_package_url} -P ~/Downloads"
  action :run

  only_if { is_install_virtual_box & is_install_vagrant }
end

execute "Install: vagrant version #{vagrant_version}" do
  command <<-EOH
    sudo dpkg -i ~/Downloads/#{vagrant_package_name}
    sudo apt-get install -y -f
  EOH
  action :run

  only_if { is_install_virtual_box & is_install_vagrant }
end

execute 'Remove: vagrant\'s package' do
  command "rm -rf ~/Downloads/#{vagrant_package_name}"
  action :run

  only_if { is_install_virtual_box & is_install_vagrant }
end


# ---------------------------------- DOCKER -----------------------------------
docker_ubuntu_version = node[:development][:virtualization][:ubuntu][:version]
docker_base_url = node[:development][:virtualization][:docker][:url]
docker_gpg_url = "#{docker_base_url}/gpg"

is_install_docker = node[:development][:virtualization][:docker][:install]

execute 'Install: docker\'s dependencies' do
  command 'sudo apt-get install  -y apt-transport-https ca-certificates curl gnupg software-properties-common'
  action :run

  only_if { is_install_virtual_box && is_install_docker }
end

execute 'Add: docker\'s GPG Key' do
  command "curl -fsSL #{docker_gpg_url} | sudo apt-key add -"
  action :run

  only_if { is_install_virtual_box && is_install_docker }
end

execute 'Add: docker\'s repository' do
  command_add_repository = "sudo add-apt-repository 'deb [arch=amd64] #{docker_base_url} #{docker_ubuntu_version} stable'"

  command "sudo add-apt-repository 'deb [arch=amd64] #{docker_base_url} #{docker_ubuntu_version} stable'"
  action :run

  only_if { is_install_virtual_box && is_install_docker }
end

execute 'Update: system' do
  command 'sudo apt-get update'
  action :run

  only_if { is_install_virtual_box && is_install_docker }
end

execute 'Install: docker' do
  command 'sudo apt-get install docker-ce -y'
  action :run

  only_if { is_install_virtual_box && is_install_docker }
end


# ------------------------------ DOCKER COMPOSE -------------------------------
docker_compose_version = node[:development][:virtualization][:docker][:compose][:version]
docker_compose_path = node[:development][:virtualization][:docker][:compose][:path]

is_install_docker_compose = node[:development][:virtualization][:docker_compose][:install]

bash 'Download: docker-compose' do
  code <<-EOH
    sudo curl -L "https://github.com/docker/compose/releases/download/#{docker_compose_version}/docker-compose-$(uname -s)-$(uname -m)" -o #{docker_compose_path}
  EOH
  action :run

  only_if { is_install_docker && is_install_docker_compose }
end

bash 'Add: permission' do
  code "sudo chmod +x #{docker_compose_path}"
  action :run

  only_if { is_install_docker && is_install_docker_compose }
end


# =============================================================================
# TOOLS
# =============================================================================
# Heroku
execute 'Install: heroku-cli' do
  command 'sudo snap install heroku --classic'
end

# Postman
execute 'Install: postman' do
  command 'sudo snap install postman'
end

# CMake
execute 'Install: cmake' do
  command 'sudo snap install cmake --classic'
end


# =============================================================================
# EDITORS
# =============================================================================
