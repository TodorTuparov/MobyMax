#!/bin/bash

# run this script as root
dnf install vagrant dkms kernel-devel ansible -y
cd /etc/yum.repos.d/
wget http://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo
dnf install VirtualBox-5.2
usermod -a -G vboxusers `logname`
