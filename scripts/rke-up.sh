#!/bin/sh -e

echo 'rke up!'

# ubuntu user needs access to the vagrant group to the access shared folder
sudo usermod -a -G vagrant ubuntu
sudo chmod 774 /usr/local/etc

su ubuntu -c '/opt/bin/rke up --config /usr/local/etc/cluster.yml'
