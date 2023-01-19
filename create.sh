#!/bin/bash

kind delete cluster --name kirk
kind delete cluster --name picard

export KIND_EXPERIMENTAL_DOCKER_NETWORK=kirk
kind create cluster --config kirk/kirk.yaml

export KIND_EXPERIMENTAL_DOCKER_NETWORK=picard
kind create cluster --config picard/picard.yaml

kubectl --context=kind-kirk create -f kirk/apps.yaml
kubectl --context=kind-picard create -f picard/apps.yaml

