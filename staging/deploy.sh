kubectl create namespace superset
kubectl apply -f ./staging/secrets/secrets.yaml
helm upgrade --install --values ./staging/values.yaml superset superset/superset --namespace superset