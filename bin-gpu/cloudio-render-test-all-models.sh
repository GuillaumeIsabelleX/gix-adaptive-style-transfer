#!/bin/bash

# Inference 

source _env.sh
#/a/lib/datasets/SmallCreation/model_gia-ds-DavidBouchardGagnon-v01b-210510-864_new
export content=$lib_root/samples/contentslimmer
export image_size=4100

for m in $(cd models;ls -d *) ; do 
	if [ -e models/$m/checkpoint_long ] ; then 
		echo $m

	export modelname=$m
#export chp=345000

export savedir=/a/lib/results/$m

echo "Starting...$m"

CUDA_VISIBLE_DEVICES=-1
python main.py \
        --model_name=$modelname \
        --phase=inference \
        --image_size=$image_size \
        --ii_dir $content \
        --save_dir=$savedir


	fi 
done


