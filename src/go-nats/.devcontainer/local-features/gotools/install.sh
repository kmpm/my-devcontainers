#!/bin/bash
su ${_REMOTE_USER} -c 'go install golang.org/x/tools/cmd/goimports@latest'
su ${_REMOTE_USER} -c 'curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin'

