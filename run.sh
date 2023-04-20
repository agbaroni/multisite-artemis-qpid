#!/bin/bash

set -e -x

podman stop --filter 'label=DEMO=wildfly-enterprise'

podman system prune --filter 'label=DEMO=wildfly-enterprise' --all --volumes --force

podman network create --label DEMO=wildfly-enterprise demo

podman image build --label DEMO=wildfly-enterprise --tag runtime --file Dockerfile.runtime

( cd dbms ; . run.sh )

( cd messaging ; . run.sh )

( cd clustering ; . run.sh )
