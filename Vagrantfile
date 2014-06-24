# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "chef/debian-7.4"

  # config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
  # This next bit fixes the 'stdin is not a tty' error when shell provisioning Ubuntu boxes
  config.vm.provision :shell,
    #if there a line that only consists of 'mesg n' in /root/.profile, replace it with 'tty -s && mesg n'
    :inline => "(grep -q -E '^mesg n$' /root/.profile && sed -i 's/^mesg n$/tty -s \\&\\& mesg n/g' /root/.profile && echo 'Ignore the previous error about stdin not being a tty. Fixing it now...') || exit 0;"


  config.vm.network "forwarded_port", guest: 9001, host: 9101
  config.vm.network "forwarded_port", guest: 9002, host: 9102
  config.vm.network "forwarded_port", guest: 9003, host: 9103
  config.vm.network "forwarded_port", guest: 9004, host: 9104

  config.vm.provision "shell", path: "install-basics.sh", privileged: true
  config.vm.provision "shell", path: "install-nodejs.sh", privileged: false
  config.vm.provision "shell", path: "install-lively.sh", privileged: false
  config.vm.provision "shell", path: "install-startup-scripts.sh", privileged: false
  config.vm.provision "shell", path: "install-startup-scripts-initd.sh", privileged: true
end
