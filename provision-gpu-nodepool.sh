#!/bin/bash
az aks nodepool add \
    --resource-group taylors-llm-rg \
    --cluster-name taylors-test-cluster \
    --name gpunp \
    --node-count 1 \
    --node-vm-size Standard_NC6s_v3 \
    --node-taints sku=gpu:NoSchedule \
    --labels agentpool=gpunp \
    --aks-custom-headers UseGPUDedicatedVHD=true \
    --enable-cluster-autoscaler \
    --min-count 1 \
    --max-count 3