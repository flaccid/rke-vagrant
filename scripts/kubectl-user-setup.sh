#!/bin/sh -e

# lets do it for both vagrant and ubuntu users
# as well as root for the kubectl proxy
sudo mkdir -p /home/vagrant/.kube /home/ubuntu/.kube /root/.kube
ln -svf /usr/local/etc/kube_config_cluster.yml /home/vagrant/.kube/config
ln -svf /usr/local/etc/kube_config_cluster.yml /home/ubuntu/.kube/config
ln -svf /usr/local/etc/kube_config_cluster.yml /root/.kube/config

sudo usermod -aG vagrant ubuntu
sudo usermod -aG ubuntu vagrant
sudo usermod -aG ubuntu root
