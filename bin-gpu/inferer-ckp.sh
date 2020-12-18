#!/bin/bash

#@STCGoal Script to run in Container context to do inference
# see inference.sh (a prototype)

source _env.sh

source _inferer_env.sh $1 $2 $3



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
mkdir -m 777 $savedir

python main.py \
        --model_name=$modelname \
        --phase=inference \
        --image_size=$image_size \
        --ii_dir $content_src \
        --save_dir=$savedir/ \
	--ckpt_nmbr=$ckpt_nmbr


chmod 777 $savedir/*