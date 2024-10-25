#!/bin/bash
set -e

# create some contexts for nats
nats context save devcontainer_sys_admin --server nats://nats:4222 --user admin --password admin
nats context save devcontainer_app_app --server nats://nats:4222 --user app --password app
nats context save default --server nats://nats:4222 
nats context select default


# install nsc
curl -sf https://raw.githubusercontent.com/nats-io/nsc/main/install.sh | sh
echo 'export PATH="${PATH}:$HOME/.nsccli/bin"' >> ~/.bashrc


