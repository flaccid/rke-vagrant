#!/bin/sh -e

echo 'rke up!'

su ubuntu -c '/opt/bin/rke up --config /usr/local/etc/cluster.yml'
