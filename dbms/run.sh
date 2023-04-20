#!/bin/bash

podman image build --label DEMO=wildfly-enterprise --tag dbms --file Dockerfile

podman run --rm --name dbms --network demo --detach --interactive --tty --label DEMO=wildfly-enterprise dbms
