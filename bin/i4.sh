#!/bin/bash

# Inference 
#./i4.sh MODELNAME "/subdir" FILE_SUFFIX IMG_SIZE CONTENTDIR SAVEDIR CHKPOINT
#.
export image_size=$4
export file_suffix=$3
export ckpt_nmbr=$7

#export content=/a/lib/samples/content/
export content=$5
#export savedir=/a/lib/results/$1$2
export savedir=$6/$1$2
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
	--file_suffix=$file_suffix \
	--ckpt_nmbr=$ckpt_nmbr


chmod 777 $savedir/*
