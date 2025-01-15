#!/bin/bash
set -e

if [ ! -d $HOME/bin ]; then
    mkdir -p $HOME/bin
fi

# install nats cli
cd $HOME/bin \
    && curl -sf https://binaries.nats.dev/nats-io/natscli/nats@latest | sh 

# create some contexts for nats
$HOME/bin/nats context save devcontainer_sys_admin --server nats://nats:4222 --user admin --password admin
$HOME/bin/nats context save devcontainer_app_app --server nats://nats:4222 --user app --password app
$HOME/bin/nats context save default --server nats://nats:4222 
$HOME/bin/nats context select default


# install nsc
curl -sf https://raw.githubusercontent.com/nats-io/nsc/main/install.sh | sh
echo 'export PATH="${PATH}:$HOME/.nsccli/bin"' >> ~/.bashrc
