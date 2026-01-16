# EKS GPU Kubernetes Cluster with Observability

GPU-enabled Kubernetes cluster on AWS EKS with NVIDIA GPU Operator, time-slicing for cost optimization, and full observability stack (Prometheus + Grafana + DCGM Exporter).

## 🎯 Project Overview

This project demonstrates:
- **GPU Cluster Operations**: Managed GPU infrastructure on Kubernetes using NVIDIA GPU Operator
- **Cost Optimization**: GPU time-slicing enabling 4 workloads to share 1 physical GPU (3x cost reduction)
- **Real ML Workloads**: PyTorch ResNet50 inference running on Tesla T4 GPU
- **Production Observability**: Real-time GPU telemetry (utilization, memory, temperature, power) via DCGM Exporter → Prometheus → Grafana
- **Multi-Tenancy**: Node isolation via taints, resource quotas for GPU governance

---

## 🏗️ Architecture

