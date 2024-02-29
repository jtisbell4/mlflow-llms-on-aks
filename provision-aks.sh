#!/bin/bash
CLUSTER_NAME="taylors-gpu-cluster"
RESOURCE_GROUP="taylors-llm-rg"

az aks create \
  --resource-group ${RESOURCE_GROUP} \
  --name ${CLUSTER_NAME} \
  --enable-managed-identity \
  --enable-cluster-autoscaler \
  --min-count 1 \
  --max-count 20 \
  --generate-ssh-keys
az aks get-credentials --resource-group ${RESOURCE_GROUP} --name ${CLUSTER_NAME}
