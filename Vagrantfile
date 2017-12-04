# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'.freeze

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'ubuntu/xenial64'

  config.vm.network :private_network, ip: '10.9.0.210'

  # config.vm.network "public_network"

  # TODO: add this in
  # config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder 'etc', '/usr/local/etc'

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  # end

  # install docker (commented out because we need to use docker 1.12)
  # config.vm.provision 'docker'

  config.vm.provider :virtualbox do |vb|
    # Don't boot with headless mode
    #   vb.gui = true

    # Enable creating symlinks between guest and host
    vb.customize [
      # see https://github.com/mitchellh/vagrant/issues/713#issuecomment-17296765
      # 1) Added these lines to my config :
      #
      # 2) run this command in an admin command prompt on windows :
      #    >> fsutil behavior set SymlinkEvaluation L2L:1 R2R:1 L2R:1 R2L:1
      #    see http://technet.microsoft.com/ja-jp/library/cc785435%28v=ws.10%29.aspx
      # 3) REBOOT HOST MACHINE
      # 4) 'vagrant up' from an admin command prompt
      'setextradata', :id,
      'VBoxInternal2/SharedFoldersEnableSymlinksCreate/vagrant-root', '1'
    ]

    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize [
      'modifyvm', :id,
      '--natdnshostresolver1', 'on',
      '--memory', '512',
      '--cpus', '2'
    ]
  end

  # docker 1.12
  config.vm.provision 'shell', path: 'scripts/provision-docker.sh'

  # install the vagrant ssh key
  config.vm.provision 'shell', path: 'scripts/setup-pki.sh'

  # rke cli install
  config.vm.provision 'shell', path: 'scripts/rke-install.sh'

  # rke bootstrap
  config.vm.provision 'shell', path: 'scripts/rke-up.sh'
end
