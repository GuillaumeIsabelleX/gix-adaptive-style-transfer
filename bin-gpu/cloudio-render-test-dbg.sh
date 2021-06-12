#!/bin/bash

# Inference 

source _env.sh
#/a/lib/datasets/SmallCreation/model_gia-ds-DavidBouchardGagnon-v01b-210510-864_new
export content=$lib_root/samples/contentslimmer
export image_size=2100
export modelname=model_gia-ds-DavidBouchardGagnon-v01b-210510-864_new-315ik
#export chp=345000

export savedir=/a/lib/results/cloudio_test_drive

echo "Starting..."

CUDA_VISIBLE_DEVICES=-1
python main.py \
	--model_name=$modelname \
	--phase=inference \
	--image_size=$image_size \
	--ii_dir $content \
	--save_dir=$savedir


