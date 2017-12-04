#!/bin/sh -e

su ubuntu -c '/opt/bin/rke up --config /usr/local/etc/cluster.yml'
