resource_name :rvm_gem
default_action :create

property :user_name, String, default: node[:personal][:user][:name]
property :directory, String, default: node[:system][:home]

property :ruby_version, String, required: true
property :gem, String, required: true


action :create do
  gem_version = new_resource.gem


  execute 'Install: Gem' do
    environment 'HOME' => new_resource.directory
    command "bash -l -c 'rvm use #{new_resource.ruby_version}; gem install #{gem_version}'"
    user new_resource.user_name
    group 'rvm'
  end
end
