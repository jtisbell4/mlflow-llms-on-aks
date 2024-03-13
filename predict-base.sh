
export INGRESS_HOST=$(kubectl -n basic get service wine-service -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
export INGRESS_PORT=$(kubectl -n basic get service wine-service -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')
export INGRESS_URL=$INGRESS_HOST:8080
curl \
    -X POST \
    -H 'Content-Type: application/json' \
    -d @./test_input.json \
    http://${INGRESS_URL}/invocations