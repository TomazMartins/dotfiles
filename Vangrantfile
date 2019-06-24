Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/bionic64'

  config.vm.provider 'virtualbox' do |vb|
    vb.memory = 1536
    vb.cpus = 2
  end

  # Fix error stdin no tty
  config.vm.provision 'fix-no-tty', type: 'shell' do |shell|
    shell.privileged = false
    shell.inline = "sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile"
  end
end
