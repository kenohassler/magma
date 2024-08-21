#!/bin/bash
set -e

apt-get update && \
    apt-get install -y make build-essential cmake git \
    python-pip python-dev wget zlib1g-dev

# Install Python packages
pip install --upgrade pip==9.0.3
pip install wllvm

# install newer version of go (back-ported from 7da098fb)
wget -qO- https://go.dev/dl/go1.19.1.linux-amd64.tar.gz | tar xz -C /usr/local/ --strip-components=1

# Install gllvm
go install github.com/SRI-CSL/gllvm/cmd/...@latest
