#!/bin/sh -e

echo 'provision docker'

if ! command -v docker >/dev/null; then
  curl -Ss https://releases.rancher.com/install-docker/17.03.sh | sh
  usermod -aG docker ubuntu
fi

# allow a few seconds for the docker.sock to be available
sleep 5
