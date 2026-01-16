#!/bin/bash
set -e

echo "Patching ClusterPolicy to enable GPU time-slicing..."

kubectl patch clusterpolicy cluster-policy \
  -n gpu-operator \
  --type merge \
  -p '{"spec":{"devicePlugin":{"config":{"name":"time-slicing-config","default":"any"}}}}'

echo "Waiting for device plugin to restart..."
sleep 30

kubectl -n gpu-operator wait --for=condition=Ready pods -l app=nvidia-device-plugin-daemonset --timeout=120s

echo ""
echo "Time-slicing enabled! Verify with:"
echo "  kubectl describe node -l role=gpu-worker | grep nvidia.com/gpu"
echo "  # Should show: nvidia.com/gpu: 4"
