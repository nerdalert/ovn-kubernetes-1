#!/usr/bin/env bash

set -ex

export GO111MODULE="on"

# Install kubectl
pushd $GOPATH/src/k8s.io/kubernetes/
sudo ln ./_output/local/go/bin/kubectl /usr/local/bin/kubectl
sudo ln ./_output/local/go/bin/e2e.test /usr/local/bin/e2e.test
popd

# Install kind
mkdir -p $GOPATH/bin
wget -O $GOPATH/bin/kind https://github.com/kubernetes-sigs/kind/releases/download/v0.7.0/kind-linux-amd64
chmod +x $GOPATH/bin/kind

# Copy the build from openshift/ovn-kubernetes to github.com/ovn-org/ since CNO kind looks there
mkdir -p $GOPATH/src/github.com/ovn-org/ovn-kubernetes
cp -rT ../ $GOPATH/src/github.com/ovn-org/ovn-kubernetes
git clone --single-branch --branch master https://github.com/openshift/cluster-network-operator.git \
$GOPATH/src/github.com/openshift/cluster-network-operator

# Run the CNO kind install
pushd $GOPATH/src/github.com/openshift/cluster-network-operator/hack
./ovn-kind-cno.sh
popd