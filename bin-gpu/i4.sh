#!/bin/bash

# Inference 
#./i4.sh MODELNAME "/subdir" FILE_SUFFIX IMG_SIZE CONTENTDIR SAVEDIR CHKPOINT
#./i4.sh model_gia-young-picasso-v03-201216_new /subdir __suffix 1024 /a/lib/samples/content /a/lib/results/someoutput 285000
source _env.sh

export image_size=$4
echo "Image size: $image_size"
export ckpt_k=$7
export ckpt_nmbr=$ckpt_k'000'
echo "ckpt_nmbr=$ckpt_nmbr"

export file_suffix=$3'__'$ckpt_k'k'
echo "file_suffix=$file_suffix"

#export content=/a/lib/samples/content/
export content=$5
#export savedir=/a/lib/results/$1$2
export savesubdir=$2
export savedir=$6/$savesubdir
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

#CUDA_VISIBLE_DEVICES=-1 python main.py \
#echo "CUDA_VISIBLE_DEVICES=$CUDA_VISIBLE_DEVICES"
#sleep 1

python main.py \
	--model_name=$modelname \
	--phase=inference \
	--image_size=$image_size \
	--ii_dir data \
	--save_dir=$savedir/ \
	--file_suffix=$file_suffix \
	--ckpt_nmbr=$ckpt_nmbr


chmod 777 $savedir/*
#./i4.sh model_gia-young-picasso-v03-201216_new /subdir __suffix 1024 /a/lib/samples/content /a/lib/results/someoutput 285000
