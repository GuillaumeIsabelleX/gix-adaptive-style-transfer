#!/bin/bash

#export container_tag=guillaumeai/ast:gpu-cpu-limitation-210421


replacerstr="model_"
secondString=""
modelFolderName=$1
export modelnameonly="${modelFolderName/$replacerstr/$secondString}"

export container_tag=guillaumeai/ast:$modelnameonly

docker build --build-arg MODEL_TO_COPY=$modelFolderName -t $container_tag . 

docker push $container_tag