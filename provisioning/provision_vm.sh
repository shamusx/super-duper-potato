#!/bin/bash -e

yum remove -y firewalld

sudo rpm -ihv https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[azure-cli]\nname=Azure CLI\nbaseurl=https://packages.microsoft.com/yumrepos/azure-cli\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/azure-cli.repo'
sudo yum install -y epel-release azure-cli-2.0.65 ansible git nginx python-pip bind bind-utils docker python-devel vim tmux jq redis python-redis
sudo yum groupinstall -y 'Development Tools'

sudo pip install avisdk docker boto3 awscli ansible==2.6.17
sudo ansible-galaxy install avinetworks.avisdk avinetworks.aviconfig

sudo sed -i 's/^#\(host_key_checking = False\)/\1/' /etc/ansible/ansible.cfg
