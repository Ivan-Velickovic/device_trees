#!/bin/bash

set -e

mkdir -p dtbs

DTBS=`realpath dtbs`
LINUX=`realpath "$1"`

ARCHS=("arm64" "riscv")

pushd $LINUX

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    EXTRA_LINUX_FLAGS=""
elif [[ "$OSTYPE" == "darwin"* ]]; then
    EXTRA_LINUX_FLAGS="LLVM=1"
else
    echo "Unknown OSTYPE: $OSTYPE"
    exit 1
fi

for ARCH in "${ARCHS[@]}"; do
    make ARCH=$ARCH $EXTRA_LINUX_FLAGS defconfig
    make ARCH=$ARCH $EXTRA_LINUX_FLAGS dtbs -j$(nproc)
done

for ARCH in "${ARCHS[@]}"; do
    find . -name '*.dtb' -print0 | xargs -0 -I {} cp {} $DTBS/
done

popd
