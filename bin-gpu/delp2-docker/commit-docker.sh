#!/bin/bash

source _env.sh

docker commit $1 $containertag 
source push-docker.sh


