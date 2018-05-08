# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'.freeze

# rubocop:disable BlockLength
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'ubuntu/xenial64'
  config.ssh.forward_agent = true
  config.vm.synced_folder 'etc',
                          '/usr/local/etc',
                          owner: 'ubuntu',
                          group: 'ubuntu'

  # networking
  # config.vm.network 'public_network'
  # config.vm.network :private_network, ip: '10.8.8.8'
  config.vm.network 'forwarded_port', guest: 8001, host: 8001
  # config.vm.network 'forwarded_port', guest: 443, host: 8443
  # config.vm.network 'forwarded_port', guest: 6443, host: 6443

  config.vm.provider :virtualbox do |vb|
    # Don't boot with headless mode
    #   vb.gui = true

    # enable creating symlinks between guest and host
    vb.customize [
      'setextradata', :id,
      'VBoxInternal2/SharedFoldersEnableSymlinksCreate/vagrant-root', '1'
    ]

    # Use VBoxManage to customize the VM
    vb.customize [
      'modifyvm', :id,
      '--natdnshostresolver1', 'on',
      '--memory', '4096',
      '--cpus', '2'
    ]
  end

  # Needed in order to run screen
  # https://www.vagrantup.com/docs/vagrantfile/ssh_settings.html
  # http://stackoverflow.com/questions/27545745/start-screen-detached-in-a-vagrant-box-with-ssh-how
  config.ssh.pty = true

  # we only want to install a supported version of docker
  config.vm.provision 'shell', path: 'scripts/provision-docker.sh'

  # install the (insecure) vagrant ssh key
  config.vm.provision 'shell', path: 'scripts/setup-pki.sh'

  # rke cli install
  config.vm.provision 'shell', path: 'scripts/rke-install.sh'

  # rke bootstrap
  config.vm.provision 'shell', path: 'scripts/rke-up.sh'

  # install kubectl locally
  config.vm.provision 'shell', path: 'scripts/kubectl-install.sh'

  # install kubernetes dashboard
  config.vm.provision 'shell', path: 'scripts/dashboard-install.sh'

  # local user configuration for kubectl etc.
  config.vm.provision 'shell', path: 'scripts/kubectl-user-setup.sh'
end
