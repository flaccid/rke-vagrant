#!/bin/sh

echo 'install rke'
mkdir -p /opt/bin
curl -LSs https://github.com/rancher/rke/releases/download/v0.0.7-dev/rke_linux-amd64 > /opt/bin/rke
chmod +x /opt/bin/rke
