# TLDR

```bash
kubectl api-resources
kubectl options
kubectl explain RESOURCE

kubectl run my-custom-pod-name --image=nginx --dry-run=client -o yaml > pod-manifest.yaml
kubectl create deployment my-custom-deployment-name --image=nginx --replicas=10 --dry-run=client -o yaml > deploy-manifest.yaml
kubectl create namespace my-custom-namespace-name --dry-run=client -o yaml > namespace-manifest.yaml

kubectl apply -f manifest.yaml


kubectl describe RESOURCE NAME | less
kubectl get RESOURCE NAME -o yaml | less
kubectl edit RESOURCE NAME

kubectl delete RESOURCE NAME
```
