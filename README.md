## Multi cluster [clustermesh] testing with kindnet CNI in KIND

### Steps

1. Create a kind cluster in a user defined bridge. Provide pod subnet and service subnet in kind config.

    ```
    export KIND_EXPERIMENTAL_DOCKER_NETWORK=kirk
    kind create cluster --config kirk/kirk.yaml
    ```

2. Create another kind cluster in a new user defined bridge. Provide pod subnet and service subnet in kind config.

    ```
    export KIND_EXPERIMENTAL_DOCKER_NETWORK=picard
    kind create cluster --config picard/picard.yaml
    ```

3. Create deployments in the clusters.

    ```
    kubectl --context=kind-kirk create -f kirk/apps.yaml
    kubectl --context=kind-picard create -f picard/apps.yaml
    ```

OR clone the repo and run the [script](./create.sh) that creates above setup.

A sample topology (bridge networks might have different IP ranges in your case )

![Sample Topology](./topo.png?raw=true "Sample Topology")


__**Please delete the `iptables` rules that docker created in the host that isolates the two user defined bridges.**__

### Help needed.

#### Before cilium install

1. What I must do to make one pod (tiefighter.picard) in one cluster to talk to other pod (tiefighter.kirk) in the other cluster. Same thing for the services, meaning a pod in one cluster to make calls to the service running in the other cluster. 


#### After cilium install

    ```
    export AGENT_IMAGE=<cilium-ebay-agent-image>
    export OPERATOR_IMAGE=<cilium-ebay-operator-image>

    export CILIUM_SRC=<cilium-ebay-source-for-charts>
    ```
Install cilium in both clusters using the [script](./cilium-install.sh). You will notice gateways changed, new interfaces created etc. I need help to understand what happened after the cilium install.

Then I have to start testing policies in the clustermesh. :-)