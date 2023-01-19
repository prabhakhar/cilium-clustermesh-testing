#!/bin/bash

cilium install --agent-image="${AGENT_IMAGE}" \
--operator-image="${OPERATOR_IMAGE}" \
--chart-directory="${CILIUM_SRC}/install/kubernetes/cilium" \
--config tunnel=disabled \
--config enable-high-scale-ipcache=true \
--config ipv4-native-routing-cidr=172.16.0.0/12 \
--config auto-direct-node-routes=false \
--config enable-local-node-route=false \
--config enable-endpoint-health-checking=false \
--config enable-l7-proxy=false \
--config monitor-aggregation=none \
--config debug=true \
--config enable-hubble=false \
--config enable-well-known-identities=true \
--config enable-endpoint-routes=true \
--config enable-no-encapsulation=true \
--config enable-k8s-networkpolicy=false \
--config cluster-name=kirk \
--config cluster-id=100 \
--restart-unmanaged-pods=false \
--context=kind-kirk

cilium status

# wait for cilium to install 

cilium install --agent-image="${AGENT_IMAGE}" \
--operator-image="${OPERATOR_IMAGE}" \
--chart-directory="${CILIUM_SRC}/install/kubernetes/cilium" \
--config tunnel=disabled \
--config enable-high-scale-ipcache=true \
--config ipv4-native-routing-cidr=172.16.0.0/12 \
--config auto-direct-node-routes=false \
--config enable-local-node-route=false \
--config enable-endpoint-health-checking=false \
--config enable-l7-proxy=false \
--config monitor-aggregation=none \
--config debug=true \
--config enable-hubble=false \
--config enable-well-known-identities=true \
--config enable-endpoint-routes=true \
--config enable-no-encapsulation=true \
--config enable-k8s-networkpolicy=false \
--config cluster-name=picard \
--config cluster-id=200 \
--restart-unmanaged-pods=false \
--context=kind-picard
