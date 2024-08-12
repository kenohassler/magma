#!/bin/bash
set -e

##
# Pre-requirements:
# - env FUZZER: path to fuzzer work dir
##

# install a nightly version of Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain nightly --component llvm-tools -y
. "$HOME/.cargo/env"

cd "$FUZZER/repo/libafl_libfuzzer/libafl_libfuzzer_runtime/"
./build.sh
cp libFuzzer.a "$OUT/libFuzzer.a"

#clang++ $CXXFLAGS -std=c++11 -c "$FUZZER/src/driver.cpp" -fPIC -o "$OUT/driver.o"
