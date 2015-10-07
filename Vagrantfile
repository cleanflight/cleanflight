# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "ubuntu/precise32"

  config.vm.share_folder("cleanflight", "/home/vagrant/cleanflight", ".")

  # Allow symlinks
  config.vm.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/cross-compiler", "1"]
  # Otherwise the compile will go into swap, making things slow
  config.vm.customize ["modifyvm", :id, "--memory", "2048"]
end

