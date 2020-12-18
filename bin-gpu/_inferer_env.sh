#!/bin/bash

#@STCGoal Script to run in Container context to do inference


source _env.sh
source _setmodel.sh $1

export image_size=1280

export content=$docker_lib_root/samples/content

# where to read the content data
export content_src=data

export savedir=$docker_lib_root/results/$1$2

export modelnametmp=model_$1
replacerstr="model_"
secondString=""

export modelname="${modelnametmp/$replacerstr/$secondString}"
export modelname="${modelname/model_model_/$secondString}"
echo "DEBUG:: Modelname after subst: $modelname"

echo "Model is : model_$1"

################ Ready to run the inference #############
