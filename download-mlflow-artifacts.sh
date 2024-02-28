#!/bin/bash
# mlflow models build-docker -m runs:/da174a3779824c1fa7792e650df5b58a/model -n taylorsllmk8sregistry.azurecr.io/taylorsllmk8sregistry/test --enable-mlserver
# az acr login -n taylorsllmk8sregistry
# docker push taylorsllmk8sregistry.azurecr.io/taylorsllmk8sregistry/test

mlflow artifacts download --run-id da174a3779824c1fa7792e650df5b58a --dst-path ./artifacts
