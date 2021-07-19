#!/bin/bash

source _env.sh

docker build -t $containertag .
docker push $containertag

