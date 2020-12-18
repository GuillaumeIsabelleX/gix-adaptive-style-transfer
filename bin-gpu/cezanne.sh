#!/bin/bash
echo "-----------------------CEZANNE----------------------"
#CUDA_VISIBLE_DEVICES=1 python main.py \
#                 --model_name=model_van-gogh_new \
#                 --batch_size=1 \
#                 --phase=train \
#                 --image_size=768 \
#                 --lr=0.0002 \
#                 --dsr=0.8 \
#                 --ptcd=/path/to/Places2/data_large \
#                 --ptad=./data/vincent-van-gogh_road-with-cypresses-1890
source _env.sh

source _setmodel2.sh cezanne

echo "Mount Point::"
echo "$model_local_fullpath:/$model_rel_path"
echo "------------------------------------------"


#mkdir -p $model_local_fullpath

echo "---------------------------------------------------"
$docker_exec run -it  -v $(pwd):$container_workdir \
	-v $lib_root:$lib_root \
	-v  $model_local_fullpath:/$model_rel_path \
	-e DISPLAY=$DISPLAY \
	$container_tag
