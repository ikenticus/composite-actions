#!/usr/bin/env bash
set -e
echo $CLUSTER_CA | base64 -d >> ca.crt
kubectl config set-cluster kubernetes --certificate-authority=ca.crt --server=$CLUSTER_URL
kubectl config set-credentials $CLUSTER_USER --token=$(echo $CLUSTER_TOKEN | base64 -d)
kubectl config set-context aws --cluster=kubernetes --user=$CLUSTER_USER
kubectl config use-context aws --user=$CLUSTER_USER
kubectl get pods -A
