#!/bin/bash

# get credentials to connect with cluster
az aks get-credentials --name aks-my-cluster --resource-group rg-my-aks

#  install helm cli
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

# install dashboard
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml

# install hashicorp vault
helm repo add hashicorp https://helm.releases.hashicorp.com
helm install vault hashicorp/vault
