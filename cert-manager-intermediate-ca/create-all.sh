#!/bin/bash

## Install cert-manager
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.17.2/cert-manager.yaml

## Apply manifest
kubectl create namespace mongodb
kubectl apply -f intermediate-tls-stack.yaml
