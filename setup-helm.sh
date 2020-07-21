#!/bin/bash

# kubectl delete limits limits

# kubectl delete limits limits --namespace=kube-system

kubectl label namespace/kube-system name=kube-system --overwrite

kubectl -n kube-system create sa tiller

kubectl create clusterrolebinding tiller-cluster-rule \
    --clusterrole=cluster-admin \
    --serviceaccount=kube-system:tiller

helm init --override 'spec.template.spec.containers[0].command'='{/tiller,--storage=secret}' --skip-refresh --upgrade --service-account tiller

kubectl rollout status --namespace=kube-system deployment/tiller-deploy --watch
