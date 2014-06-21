# -*- mode: ruby -*-
# vi: set ft=ruby :
API_VERSION = "2"

Vagrant.configure(API_VERSION) do |config|

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--nictype1", "Am79C973"]
    vb.customize ["modifyvm", :id, "--nictype2", "Am79C973"]
  end 

  config.vm.box = 'https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box'

  config.vm.define "cache" do |cache|
    cache.vm.provider "virtualbox" do |devmastervb|
        devmastervb.memory=512
        devmastervb.cpus=1
    end
    cache.vm.network "private_network", ip: "10.2.1.10", netmask: "255.255.0.0"
    cache.vm.provision "shell", inline: "sudo apt-get install -y squid-deb-proxy"
    cache.vm.provision "shell", inline: "sudo echo ppa.launchpad.net >> /etc/squid-deb-proxy/mirror-dstdomain.acl"
    cache.vm.synced_folder "./apt-cache", "/var/cache/apt-cacher-ng", :mount_options => ["dmode=777","fmode=777"] 
    cache.vm.provision "file", source: './squid-deb-proxy.conf', destination: '/home/vagrant/squid-deb-proxy.conf'
    cache.vm.provision "shell", inline: "sudo cp /home/vagrant/squid-deb-proxy.conf /etc/squid-deb-proxy/squid-deb-proxy.conf"
    cache.vm.provision "shell", inline: "sudo service squid-deb-proxy restart"
  end

  config.vm.define "devmaster" do |devmaster|
    devmaster.vm.provider "virtualbox" do |devmastervb|
        devmastervb.memory=3072
        devmastervb.cpus=5
    end
    devmaster.vm.host_name = "devmaster.local"
    devmaster.vm.network "private_network", ip: "10.12.0.10", netmask: "255.255.0.0"
    devmaster.vm.provision "shell", inline: 'echo "Acquire::http { Proxy \"http://10.2.1.10:8000\";  };" > /etc/apt/apt.conf.d/02cache' 
     
    devmaster.vm.provision "ansible" do |ansible|
      ansible.playbook = "playbook.yml"
      ansible.verbose = 'vvv'
    end

    devmaster.vm.provision "file", source: '~/.ssh/id_rsa', destination: '~/.ssh/id_rsa'
    devmaster.vm.synced_folder "../..", "/home/darren/Projects", owner: 'darren', group: 'darren', :mount_options => ["dmode=777","fmode=777"] 
 end
end
