#!/bin/bash

# Inference 

export image_size=1280

export content=/a/lib/samples/content/
export savedir=/a/lib/results/$1$2
export modelname=model_$1

export modelnametmp=model_$1
replacerstr="model_"
secondString=""

export modelname1="${modelnametmp/$replacerstr/$secondString}"
export modelname1="${modelname1/model_model_/$secondString}"

export modelname=model_$modelname1

echo "Model is : model_$1"

rm -f data/*
cp -f $content/*jpg data
cp -f $content/*png data
cp -f $content/*JPG data
cp -f $content/*PNG data

CUDA_VISIBLE_DEVICES=-1 python main.py \
	--model_name=$modelname \
	--phase=inference \
	--image_size=$image_size \
	--ii_dir data \
	--save_dir=$savedir/


chmod 777 $savedir/*
