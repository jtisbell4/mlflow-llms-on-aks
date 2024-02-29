#!/bin/bash
kubectl patch configmap config-features --namespace knative-serving --patch-file knative-config-patch.yaml --type=merge
