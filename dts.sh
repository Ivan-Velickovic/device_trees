#!/bin/bash

set -e

mkdir -p dtbs
mkdir -p dts

for i in dtbs/*.dtb; do
    filename=`basename "$i" .dtb`
    dtc -q -I dtb -O dts "$i" -o dts/$filename.dts
done

