## Create Cluster
```bash
eksctl create cluster \
  --name demo \
  --region us-east-1 \
  --nodegroup-name cpu-nodes \
  --node-type t3.medium \
  --nodes 1 \
  --nodes-min 1 \
  --nodes-max 2

  