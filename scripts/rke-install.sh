#!/bin/sh -e

echo 'provision rke'

export PATH="$PATH:/opt/bin"

if ! command -v rke >/dev/null; then
  mkdir -p /opt/bin
  echo '> download rke'
  curl -LSs \
      https://github.com/rancher/rke/releases/download/v0.1.6/rke_linux-amd64 > /opt/bin/rke
  chmod +x /opt/bin/rke
fi
