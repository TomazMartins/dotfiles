resource_name :rvm_ruby
default_action :create


property :default, kind_of: [TrueClass, FalseClass], default: false
property :user_name, String, default: node[:personal][:user][:name]
property :directory, String, default: node[:system][:home]
property :version, String, required: true


action :create do
  ruby_environment = { 'HOME' => new_resource.directory, 'USER' => new_resource.user_name }
  ruby_version = new_resource.version
  ruby_default = new_resource.default


  execute 'Install: Ruby' do
    environment ruby_environment
    user new_resource.user_name
    group 'rvm'

    command "bash -l -c 'rvm install #{ruby_version}'"
  end


  execute 'Setting: Default Version' do
    only_if { ruby_default }

    environment ruby_environment
    user new_resource.user_name
    group 'rvm'

    command "bash -l -c 'rvm --default use #{ruby_version}'"
  end
end