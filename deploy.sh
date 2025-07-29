# First apply terraform to create nodegroups the cluster
kubectl create namespace superset
kubectl apply -f ./staging/secrets/secrets.yaml
helm upgrade --install --values ./staging/values.yaml superset superset/superset --namespace superset
# Wait for the superset pod to be ready
# Then apply the ingress