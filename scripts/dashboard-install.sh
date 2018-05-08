#!/bin/sh -e

# https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/

if ! kubectl --kubeconfig /usr/local/etc/kube_config_cluster.yml \
      get pods --all-namespaces | grep dashboard; then
  echo '> install kubernetes dashboard'
  kubectl --kubeconfig /usr/local/etc/kube_config_cluster.yml \
    create -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml

  # https://github.com/kubernetes/dashboard/wiki/Access-control#admin-privileges
  kubectl --kubeconfig /usr/local/etc/kube_config_cluster.yml \
    create -f /usr/local/etc/dashboard-admin.yaml
else
  echo '> dashboard is already deployed'
fi

echo '> start kubectl proxy'
screen -dmS kubectl-proxy bash -c 'kubectl --kubeconfig /usr/local/etc/kube_config_cluster.yml proxy --disable-filter=true --address=0.0.0.0'
