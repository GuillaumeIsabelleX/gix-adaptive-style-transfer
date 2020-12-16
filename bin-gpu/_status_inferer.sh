#!/bin/bash

#@STCGoal Script to look at the running Container context to do inference
# see inference.sh (a prototype)
echo "----------------------------------------"
echo "--- Run this with the same param as the inferer.sh to look at the environment"
echo "--- and hopefully debug or trust all is great"
echo "----------------------------------------------"

echo "Sourcing _env.sh..."
source _env.sh
echo "...done sourcing _env.sh"
echo "------------------"
echo "Sourcing _inferer_env.sh \$1 \$2 \$3"
source _inferer_env.sh $1 $2 $3
echo "... done sourcing _inferer_env.sh"
echo "-------------------"
echo "-----------------------------------------------------"

echo "--- Checking up the Environment ----"

echo "-------------------------------------"
echo "- Relative to local env and model dir"
echo "--------------------"
echo "lib_root=$lib_root"
echo "docker_lib_root=$docker_lib_root"
echo "model_root=$model_root"
echo "------------"
echo "-- Model path mount point LOCALDIR:CONTAINERDIR : "
echo "--- $model_root/models:$container_models_fullpath"
echo "----------------------"
echo "----------------------"
echo "- Relative to the desired inference context define by : "
echo "-------------------"
echo "--  $0 MODELNAME SUFFIX_TO_OUTPUT "
echo "image_size=$image_size"
echo "content=$content"
echo "content_src=$content_src"
echo "savedir=$savedir"
echo "modelname=$modelname"
echo "model_inference_name=$model_inference_name"
echo "----------------------"
echo "-- Should be ready to run: "
echo "--  ./run-gpu-inference $1 $2 $3"
echo "----------------------------"


