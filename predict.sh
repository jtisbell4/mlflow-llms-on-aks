
export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')
export INGRESS_URL=$INGRESS_HOST:$INGRESS_PORT
curl \
    -X POST \
    -H 'Content-Type: application/json' \
    -d @./test_input.json \
    http://${INGRESS_URL}/seldon/seldon/mlflow/api/v1.0/predictions