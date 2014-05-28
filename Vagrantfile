# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "michaelkirk/wetap-api"

  # wetap-api box was originally based on bdon/geo
  #config.vm.box = "bdon/geo"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 3000, host: 4000

  # Only provision if you need to rebuild the machine from scratch (e.g. from
  # the bdon/GeoVM base box).
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provisioning/base.yml"
  end

end
