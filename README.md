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



---

## ✨ Key Features

### GPU Management
- **NVIDIA GPU Operator** manages complete GPU software stack (drivers, runtime, device plugin)
- **GPU Time-Slicing** enabled (4 logical replicas per physical GPU)
- **Node isolation** via taints ensures only GPU workloads land on expensive GPU nodes

### Observability
- **Prometheus** scrapes DCGM metrics every 30s
- **Grafana dashboards** visualize GPU utilization, memory, temperature, power
- **Real-time monitoring** during ML inference workloads

### Cost Optimization
- g4dn.xlarge: **$0.526/hour** (~$380/month)
- With time-slicing (4 pods/GPU): **~$95/pod/month**


---

## 🚀 Prerequisites

- AWS account with billing enabled
- AWS CLI configured (`aws configure`)
- `eksctl` installed
- `kubectl` v1.28+
- `helm` v3.x
- **AWS Quota:** "Running On-Demand G and VT instances" ≥ 4 vCPUs

---

## 📦 Quick Start

### 1. Create EKS Cluster
```bash
eksctl create cluster \
  --name gpu-demo \
  --region us-east-1 \
  --nodegroup-name cpu-nodes \
  --node-type t3.medium \
  --nodes 1

### 2. Add GPU Node Pool
```bash
eksctl create nodegroup \
  --cluster gpu-demo \
  --region us-east-1 \
  --name gpu-nodes \
  --node-type g4dn.xlarge \
  --nodes 1 \
  --nodes-min 0 \
  --nodes-max 1 \
  --node-labels role=gpu-worker

