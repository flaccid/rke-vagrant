#!/bin/sh -e

echo 'provision pki'

ssh_user=ubuntu
home="$(eval echo ~$ssh_user)"

echo "> setup pki ($ssh_user: $home)"

curl -Ss https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub >> "$home/.ssh/authorized_keys"

mkdir -p "$home/.ssh"

if [ ! -e "$home/.ssh/id_rsa" ]; then
  echo '> install insecure private ssh key'
  curl -Ss https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant > "$home/.ssh/id_rsa"
fi

chown "$ssh_user" "$home/.ssh/id_rsa"
chmod 400 "$home/.ssh/id_rsa"
