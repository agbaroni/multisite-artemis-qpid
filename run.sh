#!/bin/bash

start_broker() {
    ID=$1
    PORT=$2

    cd broker$ID
    buildah build -t broker$ID .
    podman run --rm --name broker$ID -p $PORT:8161 --network demo -dit broker$ID
    cd ..
}

start_router() {
    ID=$1
    PORT=$2

    cd router$ID
    buildah build -t router$ID .
    podman run --rm --name router$ID -p $PORT:8161 --network demo -dit router$ID
    cd ..
}

start_dbms() {
    PORT=$1

    cd dbms
    buildah build -t dbms .
    podman run --rm --name dbms --network demo -p $PORT:5432 -dit dbms
    cd ..
}

start() {
    podman network create demo

    start_dbms 5432

    cd broker
    buildah build -t broker .
    cd ..

    start_broker 11m 8161
    start_broker 11s 8162
    start_broker 12m 8171
    start_broker 12s 8172

    start_broker 21m 8261
    start_broker 21s 8262
    start_broker 22m 8271
    start_broker 22s 8272

    cd router
    buildah build -t router .
    cd ..

    start_router 1a 8181
    start_router 2a 8281
}

stop() {
    podman rm -f router2a

    podman rm -f router1a

    podman rm -f broker22s
    podman rm -f broker22m
    podman rm -f broker21s
    podman rm -f broker21m

    podman rm -f broker12s
    podman rm -f broker12m
    podman rm -f broker11s
    podman rm -f broker11m

    podman rm -f dbms

    podman network rm -f demo

    podman rmi router2a

    podman rmi router1a

    podman rmi broker21m
    podman rmi broker21s
    podman rmi broker22m
    podman rmi broker22s

    podman rmi broker11m
    podman rmi broker11s
    podman rmi broker12m
    podman rmi broker12s

    podman rmi router

    podman rmi broker
}

stop

start
