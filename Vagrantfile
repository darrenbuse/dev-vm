# -*- mode: ruby -*-
# vi: set ft=ruby :
API_VERSION = "2"

Vagrant.configure(API_VERSION) do |config|

  config.vm.box = 'https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box'
  
  config.vm.synced_folder ".", "/vagrant"
  config.vm.synced_folder "./cache", "/cache"
  config.vm.synced_folder "../..", "/home/vagrant/Projects"

  config.vm.define "devmaster" do |app|
    app.vm.network "private_network", ip: "66.66.66.10"
    app.vm.host_name = "devmaster.local"
    config.vm.provision "ansible" do |ansible|
       ansible.playbook = "playbook.yml"
       ansible.verbose = 'vvv'
   end
 end
end
