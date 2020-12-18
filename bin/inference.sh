#!/bin/bash

# Inference 

export image_size=1280

export content=/a/lib/samples/content/
export savedir=/a/lib/results/$1$2
export modelname=model_$1


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