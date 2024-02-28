#!/bin/bash

az aks create \
  --resource-group taylors-llm-rg \
  --name taylors-test-cluster \
  --enable-managed-identity \
  --enable-cluster-autoscaler \
  --min-count 1 \
  --max-count 20 \
  --generate-ssh-keys
az aks get-credentials --resource-group taylors-llm-rg --name taylors-test-cluster
curl -sSL https://github.com/knative/serving/releases/download/knative-v1.10.1/serving-core.yaml \
  | grep 'gcr.io/' | awk '{print $2}' | sort | uniq \
  | xargs -n 1 \
    cosign verify -o text \
      --certificate-identity=signer@knative-releases.iam.gserviceaccount.com \
      --certificate-oidc-issuer=https://accounts.google.com
kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.13.1/serving-crds.yaml
kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.13.1/serving-core.yaml
kubectl apply -l knative.dev/crd-install=true -f https://github.com/knative/net-istio/releases/download/knative-v1.13.0/istio.yaml
kubectl apply -f https://github.com/knative/net-istio/releases/download/knative-v1.13.0/istio.yaml
kubectl apply -f https://github.com/knative/net-istio/releases/download/knative-v1.13.0/net-istio.yaml
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.14.3/cert-manager.yaml
kubectl apply -f https://github.com/kserve/kserve/releases/download/v0.11.0/kserve.yaml
kubectl apply -f https://github.com/kserve/kserve/releases/download/v0.11.0/kserve-runtimes.yaml
kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.13.1/serving-default-domain.yaml
kubectl create namespace mlflow
kubectl apply -f mlserve-test.yml