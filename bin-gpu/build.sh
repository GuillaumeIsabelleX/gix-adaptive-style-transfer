#!/bin/bash

docker build -t jgwill/gix-adaptive-style-transfer .
docker build -t jgwill/gix-adaptive-style-transfer:gpu .

docker push jgwill/gix-adaptive-style-transfer:gpu


