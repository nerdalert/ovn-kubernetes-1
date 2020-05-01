#!/usr/bin/env bash

set -ex

export GO111MODULE="on"

pushd $GOPATH/src/k8s.io/kubernetes/
sudo ln ./_output/local/go/bin/kubectl /usr/local/bin/kubectl
sudo ln ./_output/local/go/bin/e2e.test /usr/local/bin/e2e.test
popd

mkdir -p $GOPATH/bin
wget -O $GOPATH/bin/kind https://github.com/kubernetes-sigs/kind/releases/download/v0.7.0/kind-linux-amd64
chmod +x $GOPATH/bin/kind
#pushd ../contrib

git clone --single-branch --branch master https://github.com/openshift/cluster-network-operator.git $GOPATH/src/github.com/openshift/cluster-network-operatorpushd $GOPATH/src/github.com/openshift/cluster-network-operator
popd GOPATH/src/github.com/openshift/cluster-network-operatorpushd/hack
./ovn-kind-cno.sh

popd
