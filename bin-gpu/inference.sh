#!/bin/bash

# Inference 


export content=/a/lib/datasets/gia_style_AcrylicPaint2012/IMG_0005.JPG
export image_size=1280

CUDA_VISIBLE_DEVICES=0 python main.py \
	--model_name=model_cezanne \
	--phase=inference \
	--image_size=$image_size \
	--ii_dir /a/lib/samples/content/ \
	--save_dir=/a/lib/results/x__cezanne_inference__2012052128/



chmod 777 $savedir/*