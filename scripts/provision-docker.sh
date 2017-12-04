#!/bin/sh -e

if ! command -v docker >/dev/null; then
  curl -Ss https://releases.rancher.com/install-docker/1.12.sh | sh
  usermod -aG docker ubuntu
fi
