# -*- mode: ruby -*-
# vi: set ft=ruby :
API_VERSION = "2"

Vagrant.configure(API_VERSION) do |config|

  config.vm.box = 'https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box'
    config.vm.network "private_network", ip: "10.12.0.10", netmask: "255.255.0.0"
    config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
        vb.customize ["modifyvm", :id, "--nictype1", "Am79C973"]
        vb.customize ["modifyvm", :id, "--nictype2", "Am79C973"]
    end 
  config.vm.synced_folder ".", "/vagrant"
  config.vm.synced_folder "./cache", "/cache"
  config.vm.synced_folder "../..", "/home/vagrant/Projects"

    config.vm.provision "shell", inline: 'echo "Acquire::http { Proxy \"http://10.2.1.10:3142\";  };" > /etc/apt/apt.conf.d/02cache' 
  config.vm.define "devmaster" do |app|
    app.vm.host_name = "devmaster.local"
    config.vm.provision "ansible" do |ansible|
       ansible.playbook = "playbook.yml"
       ansible.verbose = 'vvv'
   end
 end
end
