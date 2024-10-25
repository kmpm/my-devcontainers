#!/bin/bash
cd $(dirname "$0")
source test-utils.sh



# Template specific tests
check "distro" lsb_release -c
check "natscli" nats --version
check "nsc" nsc --version
check "nats-server connection" nats server info --server nats://nats:4222 --user=admin --password=admin | grep -i -s "Version" | awk '{$1=$1};1'
check "nats-server system_account" curljq "http://nats:8222/accountz" '.system_account' 



# Report result
reportResults

echo Debug
cat somefile.json