#!/bin/bash

# Inference 

export suboutput=255000
export content=/a/lib/samples/content
export outpath=/a/lib/results/x__cezanne_inference__2012052128

export image_size=2048

export outfullpath=$outpath/$suboutput

echo "Model is : model_$1"
rm -f data/*jpg data/*png data/*txt
cp -f $content/*jpg data
cp -f $content/*png data

CUDA_VISIBLE_DEVICES=-1 python main.py \
	--model_name=model_$1 \
	--phase=inference \
	--image_size=$image_size \
	--ii_dir ./data/ \
	--save_dir=$outfullpath


