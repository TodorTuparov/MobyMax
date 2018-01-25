#!/bin/bash

vagrant init

echo "# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(\"2\") do |config|
  config.vm.box = \"centos/7\"
  config.vm.define \"mobymax\" do|mobymax|
    mobymax.vm.network \"private_network\", ip: \"172.22.0.5\"
    mobymax.vm.hostname = \"mobymax\"
    mobymax.vm.provider 'virtualbox' do |v|
      v.memory = 3072
      v.cpus = 2
    end
  end
end" > Vagrantfile

vagrant up --provider virtualbox

ansible-playbook playbook1.yml  --private-key .vagrant/machines/mobymax/virtualbox/private_key 
