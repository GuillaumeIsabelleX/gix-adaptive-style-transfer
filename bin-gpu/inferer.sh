#!/bin/bash

#@STCGoal Script to run in Container context to do inference
# see inference.sh (a prototype)

source _env.sh

source _inferer_env.sh $1 $2 $3

#export image_size=1280

#export content=$docker_lib_root/samples/content

# where to read the content data
#export content_src=data

#export savedir=$docker_lib_root/results/$1$2

#export modelname=model_$1


#echo "Model is : model_$1"

echo "Making a Local copy of the Data for inference..."
rm -f data/*
cp -f $content/*jpg data
cp -f $content/*png data
cp -f $content/*JPG data
cp -f $content/*PNG data
echo "...Done making local copy of content data from $content"
echo "-------Infering now :) ------------"
echo "-----------------------------------"
sleep 1

python main.py \
        --model_name=$modelname \
        --phase=inference \
        --image_size=$image_size \
        --ii_dir $content_src \
        --save_dir=$savedir/

