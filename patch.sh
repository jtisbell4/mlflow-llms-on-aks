#!/bin/bash
kubectl patch configmap config-features --namespace knative-serving --patch-file knative-config-patch.yaml --type=merge
kubectl patch configmap inferenceservice-config --namespace kserve --patch-file inferenceservice-config-patch.yaml --type=merge