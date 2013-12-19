# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  config.vm.network "forwarded_port", guest: 3000, host: 9300
  config.vm.network "forwarded_port", guest: 8081, host: 9281
  config.vm.network "forwarded_port", guest: 9001, host: 9101
  config.vm.network "forwarded_port", guest: 9002, host: 9102
  config.vm.network "forwarded_port", guest: 9003, host: 9103
  config.vm.network "forwarded_port", guest: 9004, host: 9104

  config.vm.provision "shell", path: "install-basics.sh"
  config.vm.provision "shell", path: "install-nodejs.sh", privileged: false
  config.vm.provision "shell", path: "install-vwf.sh", privileged: false
  config.vm.provision "shell", path: "install-lively.sh", privileged: false
  config.vm.provision "shell", path: "install-startup-scripts.sh", privileged: false
  config.vm.provision "shell", path: "install-startup-scripts-initd.sh", privileged: true
end
