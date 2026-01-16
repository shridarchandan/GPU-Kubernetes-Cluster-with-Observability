#!/bin/bash

kubectl -n monitoring patch svc kube-prometheus-grafana -p '{"spec":{"type":"LoadBalancer"}}'