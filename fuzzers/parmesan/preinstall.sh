#!/bin/bash
set -e

apt-get update && \
    apt-get install -y make build-essential git \
    python-pip python-dev wget zlib1g-dev

# Install newer CMake (than Ubuntu repos)
wget -O /tmp/cmake.sh https://github.com/Kitware/CMake/releases/download/v3.20.5/cmake-3.20.5-linux-x86_64.sh
mkdir -p /opt/cmake
/bin/bash /tmp/cmake.sh --skip-license --exclude-subdir --prefix=/opt/cmake
rm -f /tmp/cmake.sh

# Adapted from parmesan/build/install_tools.sh (because it needs to be run as root)
pip install --upgrade pip==9.0.3
pip install wllvm

# install newer version of go (back-ported from 7da098fb)
wget -qO- https://go.dev/dl/go1.19.1.linux-amd64.tar.gz | tar xz -C /usr/local/ --strip-components=1

export GOPATH="/opt/go"
mkdir -p $GOPATH
go install github.com/SRI-CSL/gllvm/cmd/...@latest
