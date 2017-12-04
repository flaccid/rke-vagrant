#!/bin/sh -e

echo 'install kubernetes dashboard'

kubectl create -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml
