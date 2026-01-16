#!/bin/bash
set -e

echo "Installing NVIDIA GPU Operator..."

helm repo add nvidia https://nvidia.github.io/gpu-operator
helm repo update

kubectl create namespace gpu-operator --dry-run=client -o yaml | kubectl apply -f -

helm install gpu-operator nvidia/gpu-operator \
  --namespace gpu-operator \
  --values gpu-operator-values.yaml

echo "Waiting for GPU Operator pods..."
kubectl -n gpu-operator wait --for=condition=Ready pods --all --timeout=300s

echo "GPU Operator installed successfully!"
echo ""
echo "Verify with:"
echo "  kubectl -n gpu-operator get pods"
echo "  kubectl describe node -l role=gpu-worker | grep nvidia.com/gpu"
