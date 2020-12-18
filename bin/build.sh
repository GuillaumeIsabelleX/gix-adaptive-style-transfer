#!/bin/bash

source _env.sh

docker build -t $container_tag .
docker build -t $container_tag_tlid .

docker push $container_tag
docker push $container_tag_tlid

#docker build -t jgwill/gix-adaptive-style-transfer:cpu .

