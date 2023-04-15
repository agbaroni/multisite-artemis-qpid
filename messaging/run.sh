#!/bin/bash

podman rm --force broker22s
podman rm --force broker22m
podman rm --force broker21s
podman rm --force broker21m
podman rm --force broker12s
podman rm --force broker12m
podman rm --force broker11s
podman rm --force broker11m

podman image rm --force broker22s
podman image rm --force broker22m
podman image rm --force broker21s
podman image rm --force broker21m
podman image rm --force broker12s
podman image rm --force broker12m
podman image rm --force broker11s
podman image rm --force broker11m

podman image rm --force broker

podman image build --tag broker --file Dockerfile.base

podman image build --build-arg=INSTANCE=11m --tag broker11m --file Dockerfile.instance
podman image build --build-arg=INSTANCE=11s --tag broker11s --file Dockerfile.instance
podman image build --build-arg=INSTANCE=12m --tag broker12m --file Dockerfile.instance
podman image build --build-arg=INSTANCE=12s --tag broker12s --file Dockerfile.instance
podman image build --build-arg=INSTANCE=21m --tag broker21m --file Dockerfile.instance
podman image build --build-arg=INSTANCE=21s --tag broker21s --file Dockerfile.instance
podman image build --build-arg=INSTANCE=22m --tag broker22m --file Dockerfile.instance
podman image build --build-arg=INSTANCE=22s --tag broker22s --file Dockerfile.instance

podman run --name broker11m --rm --network demo --detach --interactive --tty --publish 8161:8161 broker11m
podman run --name broker11m --rm --network demo --detach --interactive --tty --publish 8161:8161 broker11m
podman run --name broker11m --rm --network demo --detach --interactive --tty --publish 8161:8161 broker11m
podman run --name broker11m --rm --network demo --detach --interactive --tty --publish 8161:8161 broker11m
podman run --name broker11m --rm --network demo --detach --interactive --tty --publish 8161:8161 broker11m
podman run --name broker11m --rm --network demo --detach --interactive --tty --publish 8161:8161 broker11m
podman run --name broker11m --rm --network demo --detach --interactive --tty --publish 8161:8161 broker11m
podman run --name broker11m --rm --network demo --detach --interactive --tty --publish 8161:8161 broker11m
