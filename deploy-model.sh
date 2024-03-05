kubectl get namespace seldon || kubectl create namespace seldon
kubectl apply -f manifests/secret.yaml
kubectl apply -f manifests/seldon-test.yaml