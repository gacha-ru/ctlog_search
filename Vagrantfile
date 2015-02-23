# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define :ctkibana do |node|
    node.vm.provider :virtualbox do |vb|
      vb.name = "ctkibana"
    end
    node.vm.box = "centos6"
    node.vm.network :forwarded_port, guest: 22, host: 2203, id: "ssh"
    node.vm.network :forwarded_port, guest: 80, host: 8201, id: "http"
    node.vm.network :forwarded_port, guest: 10080, host: 10080, id: "nginx"
    node.vm.network :forwarded_port, guest: 9200, host: 9200, id: "elasticsearch"
    node.vm.network :private_network, ip: "192.168.33.23"
  end

  # ローカルにない場合
  config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.5_chef-provisionerless.box"
end
