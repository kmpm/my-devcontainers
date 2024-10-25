#!/bin/bash
set -e

curl -sf https://raw.githubusercontent.com/nats-io/nsc/main/install.sh | sh
echo 'export PATH="${PATH}:$HOME/.nsccli/bin"' >> ~/.bashrc
