# =============================================================================
# RUBY
# =============================================================================

# =============================================================================
# JAVA
# =============================================================================

# =============================================================================
# ANDROID
# =============================================================================

# =============================================================================
# C++
# =============================================================================

# =============================================================================
# DATABASES
# =============================================================================
postgres_version = node[:development][:databases][:postgres][:version]

execute "Install: Postgres #{postgres_version}" do
  command 'sudo snap install postgresql10'
  action :run
end

# =============================================================================
# VIRTUALIZATION
# =============================================================================
# -------------------------------- VIRTUAL BOX --------------------------------
virtual_box_package_name = node[:development][:virtualization][:virtual_box][:ubuntu][:package][:name]
virtual_box_package_url = node[:development][:virtualization][:virtual_box][:ubuntu][:package][:url]
virtual_box_version = node[:development][:virtualization][:virtual_box][:version]

execute "Download: virtual box  version #{virtual_box_version}" do
  command "wget #{virtual_box_package_url} -P ~/Downloads"
  action :run
end

execute "Install: virtual box version #{virtual_box_version}" do
  command <<-EOH
    sudo dpkg -i ~/Downloads/#{virtual_box_package_name}
    sudo apt-get install -y -f
  EOH
  action :run
end

execute 'Remove: virtual box\'s package' do
  command "rm -rf ~/Downloads/#{virtual_box_package_name}"
  action :run
end


# ---------------------------------- VAGRANT ----------------------------------
vagrant_package_name = node[:development][:virtualization][:vagrant][:ubuntu][:package][:name]
vagrant_package_url = node[:development][:virtualization][:vagrant][:ubuntu][:package][:url]
vagrant_version = node[:development][:virtualization][:vagrant][:version]

execute "Download: vagrant  version #{vagrant_version}" do
  command "wget #{vagrant_package_url} -P ~/Downloads"
  action :run
end

execute "Install: vagrant version #{vagrant_version}" do
  command <<-EOH
    sudo dpkg -i ~/Downloads/#{vagrant_package_name}
    sudo apt-get install -y -f
  EOH
  action :run
end

execute 'Remove: vagrant\'s package' do
  command "rm -rf ~/Downloads/#{vagrant_package_name}"
  action :run
end


# ---------------------------------- DOCKER -----------------------------------
docker_ubuntu_version = node[:development][:virtualization][:ubuntu][:version]
docker_base_url = node[:development][:virtualization][:docker][:url]
docker_gpg_url = "#{docker_base_url}/gpg"

execute 'Install: docker\'s dependencies' do
  command 'sudo apt-get install  -y apt-transport-https ca-certificates curl gnupg software-properties-common'
  action :run
end

execute 'Add: docker\'s GPG Key' do
  command "curl -fsSL #{docker_gpg_url} | sudo apt-key add -"
  action :run
end

execute 'Add: docker\'s repository' do
  command_add_repository = "sudo add-apt-repository 'deb [arch=amd64] #{docker_base_url} #{docker_ubuntu_version} stable'"

  command "sudo add-apt-repository 'deb [arch=amd64] #{docker_base_url} #{docker_ubuntu_version} stable'"
  action :run
end

execute 'Update: System' do
  command 'sudo apt-get update'
  action :run
end

execute 'Install: docker' do
  command 'sudo apt-get install docker-ce -y'
  action :run
end


# ------------------------------ DOCKER COMPOSE -------------------------------
docker_compose_version = node[:development][:virtualization][:docker][:compose][:version]
docker_compose_path = node[:development][:virtualization][:docker][:compose][:path]

bash 'Download: docker-compose' do
  code <<-EOH
    sudo curl -L "https://github.com/docker/compose/releases/download/#{docker_compose_version}/docker-compose-$(uname -s)-$(uname -m)" -o #{docker_compose_path}
  EOH
  action :run
end

bash 'Add: permission' do
  code "sudo chmod +x #{docker_compose_path}"
  action :run
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