#!/bin/bash

master() {
    echo $(printf "%dm" $1)
}

slave() {
    echo $(printf "%ds" $1)
}

m_port() {
    echo $((8161 + ($1 * 10) - 110))
}

s_port() {
    mp=$(m_port $1)
    echo $(($mp + 1))
}

create_broker_pair() {
    m=$(master $1)
    s=$(slave $1)
    mp=$(m_port $1)
    sp=$(s_port $1)
    podman image build --label DEMO=wildfly-enterprise --build-arg=INSTANCE=$m --tag broker$m --file Dockerfile.instance
    podman image build --label DEMO=wildfly-enterprise --build-arg=INSTANCE=$s --tag broker$s --file Dockerfile.instance
    podman run --name broker$m --label DEMO=wildfly-enterprise --rm --network demo --detach --interactive --tty --publish $mp:8161 broker$m
    podman run --name broker$s --label DEMO=wildfly-enterprise --rm --network demo --detach --interactive --tty --publish $sp:8161 broker$s
}

INSTANCES="11 12 21 22"

podman image build --label DEMO=wildfly-enterprise --tag broker --file Dockerfile.base

for instance in $INSTANCES; do
    create_broker_pair $instance
done
