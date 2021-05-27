#!/bin/bash

# Inference 

source _env.sh
#/a/lib/datasets/SmallCreation/model_gia-ds-DavidBouchardGagnon-v01b-210510-864_new
export content=$lib_root/datasets/SmallCreation/
export image_size=2100
export modelname=model_gia-ds-DavidBouchardGagnon-v01b-210510-864_new
export chp=345000
if [ "$1" != "" ];then # we have a chp specified
	chp=$1'000'
fi
export savedir=/a/lib/results/_highres_png__210525/$chp


CUDA_VISIBLE_DEVICES=-1
python main.py \
	--model_name=$modelname \
	--phase=inference \
	--ckpt_nmbr=$chp \
	--image_size=$image_size \
	--ii_dir $content \
	--save_dir=$savedir


