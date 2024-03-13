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
  --generate-ssh-keys \
  --location eastus2
az aks get-credentials --resource-group ${RESOURCE_GROUP} --name ${CLUSTER_NAME}
az aks nodepool add \
    --resource-group ${RESOURCE_GROUP} \
    --cluster-name ${CLUSTER_NAME} \
    --name gpunp \
    --node-count 1 \
    --node-vm-size Standard_NV36adms_A10_v5 \
    --node-taints sku=gpu:NoSchedule \
    --labels agentpool=gpunp \
    --aks-custom-headers UseGPUDedicatedVHD=true \
    --enable-cluster-autoscaler \
    --min-count 1 \
    --max-count 3
