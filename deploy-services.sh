curl -L https://istio.io/downloadIstio | sh -
cd istio-1.20.3
export PATH=$PWD/bin:$PATH
istioctl install
kubectl label namespace default istio-injection=enabled
kubectl apply -f ../manifests/istio.yaml
kubectl get namespace seldon-system || kubectl create namespace seldon-system
helm install seldon-core seldon-core-operator \
    --repo https://storage.googleapis.com/seldon-charts \
    --set usageMetrics.enabled=true \
    --set istio.enabled=true \
    --namespace seldon-system
