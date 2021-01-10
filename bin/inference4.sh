#!/bin/bash

# Inference 

export image_size=$4

export content=/a/lib/samples/$5
#export savedir=/a/lib/results/$1$2
export savedir=/a/lib/results/model_giapicallo_v04__201221/v04__090ik__2_5k
export modelname=model_$1

export modelname1=model_$1
replacerstr="model_"
secondString=""

export modelname1="${modelname1/model_model_/$secondString}"
export modelname1="${modelname1/$replacerstr/$secondString}"
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
	--save_dir=$savedir/ \
	--file_suffix=$3


chmod 777 $savedir/*
