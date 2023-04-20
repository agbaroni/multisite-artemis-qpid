#!/bin/bash

port() {
    echo $((11222 + $1 - 1))
}

create_infinispan() {
    podman image build --label DEMO=wildfly-enterprise --build-arg=INSTANCE=$1 --tag infinispan$1 --file Dockerfile.instance
    podman run --name infinispan$1 --label DEMO=wildfly-enterprise --rm --network demo --detach --interactive --tty --publish $(port $1):11222 infinispan$1
}

INSTANCES="1 2 3"

podman image build --label DEMO=wildfly-enterprise --tag infinispan --file Dockerfile.base

for instance in $INSTANCES; do
    create_infinispan $instance
done
