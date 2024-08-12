#!/bin/bash
set -e

apt-get update && \
    apt-get install -y build-essential curl git lsb-release wget software-properties-common gnupg

# install LLVM 18
curl --proto '=https' --tlsv1.2 -sSf https://apt.llvm.org/llvm.sh | bash -s -- 18

update-alternatives \
 --install /usr/lib/llvm              llvm             /usr/lib/llvm-18  20 \
 --slave   /usr/bin/llvm-config       llvm-config      /usr/bin/llvm-config-18  \
   --slave   /usr/bin/llvm-ar           llvm-ar          /usr/bin/llvm-ar-18 \
   --slave   /usr/bin/llvm-as           llvm-as          /usr/bin/llvm-as-18 \
   --slave   /usr/bin/llvm-bcanalyzer   llvm-bcanalyzer  /usr/bin/llvm-bcanalyzer-18 \
   --slave   /usr/bin/llvm-c-test       llvm-c-test      /usr/bin/llvm-c-test-18 \
   --slave   /usr/bin/llvm-cov          llvm-cov         /usr/bin/llvm-cov-18 \
   --slave   /usr/bin/llvm-diff         llvm-diff        /usr/bin/llvm-diff-18 \
   --slave   /usr/bin/llvm-dis          llvm-dis         /usr/bin/llvm-dis-18 \
   --slave   /usr/bin/llvm-dwarfdump    llvm-dwarfdump   /usr/bin/llvm-dwarfdump-18 \
   --slave   /usr/bin/llvm-extract      llvm-extract     /usr/bin/llvm-extract-18 \
   --slave   /usr/bin/llvm-link         llvm-link        /usr/bin/llvm-link-18 \
   --slave   /usr/bin/llvm-mc           llvm-mc          /usr/bin/llvm-mc-18 \
   --slave   /usr/bin/llvm-nm           llvm-nm          /usr/bin/llvm-nm-18 \
   --slave   /usr/bin/llvm-objdump      llvm-objdump     /usr/bin/llvm-objdump-18 \
   --slave   /usr/bin/llvm-ranlib       llvm-ranlib      /usr/bin/llvm-ranlib-18 \
   --slave   /usr/bin/llvm-readobj      llvm-readobj     /usr/bin/llvm-readobj-18 \
   --slave   /usr/bin/llvm-rtdyld       llvm-rtdyld      /usr/bin/llvm-rtdyld-18 \
   --slave   /usr/bin/llvm-size         llvm-size        /usr/bin/llvm-size-18 \
   --slave   /usr/bin/llvm-stress       llvm-stress      /usr/bin/llvm-stress-18 \
   --slave   /usr/bin/llvm-symbolizer   llvm-symbolizer  /usr/bin/llvm-symbolizer-18 \
   --slave   /usr/bin/llvm-tblgen       llvm-tblgen      /usr/bin/llvm-tblgen-18

update-alternatives \
 --install /usr/bin/clang                 clang                  /usr/bin/clang-18     20 \
 --slave   /usr/bin/clang++               clang++                /usr/bin/clang++-18 \
 --slave   /usr/bin/clang-cpp             clang-cpp              /usr/bin/clang-cpp-18
