#!/bin/bash

source _env.sh
rm -rf build
mkdir -p build
. ../dk-build-copy-common.sh
ls build
sleep 1

docker build -t $containertag .
#docker push $containertag

