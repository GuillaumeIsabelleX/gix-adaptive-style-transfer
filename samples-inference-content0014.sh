#!/bin/bash

# Inference 

source _env.sh

export content=$(pwd)/samples/content0014
export save_dir=$(pwd)/results/content0014
export image_size=1280

CUDA_VISIBLE_DEVICES=0 python main.py \
	--model_name=model_cezanne \
	--phase=inference \
	--image_size=$image_size \
	--ii_dir $content \
	--save_dir=$save_dir/


