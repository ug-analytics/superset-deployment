kubectl create namespace superset
helm upgrade --install --values values.yaml superset superset/superset --namespace superset