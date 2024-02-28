#!/bin/bash

INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')
SERVICE_HOSTNAME=$(kubectl get inferenceservice mlflow-v2-wine -n mlflow -o jsonpath='{.status.url}' | cut -d "/" -f 3)
curl -v \
  -H "Host: ${SERVICE_HOSTNAME}" \
  -H "Content-Type: application/json" \
  -d @./test-input.json \
  http://${INGRESS_HOST}:${INGRESS_PORT}/v2/models/mlflow-v2-wine/infer


