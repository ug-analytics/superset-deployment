kubectl create namespace superset
helm upgrade --install --values ./staging/values.yaml superset superset/superset --namespace superset