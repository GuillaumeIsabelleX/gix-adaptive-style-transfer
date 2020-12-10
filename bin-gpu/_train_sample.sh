#!/bin/bash

export lib_root=/a/lib
export modelbasename=picasso
export lib_painter_namespace=pablo-picasso
export lib_painter_fullpath=$lib_root/painterphotograph/$lib_painter_namespace
export model_name='model_'$modelbasename'_new'

mkdir data/$modelbasename

cp $lib_painter_fullpath/*jpg data/$modelbasename

CUDA_VISIBLE_DEVICES=0 python main.py \
                 --model_name=$model_name \
                 --batch_size=1 \
                 --phase=train \
                 --image_size=768 \
                 --lr=0.0002 \
                 --dsr=0.8 \
                 --ptcd=$lib_root/data_large \
                 --ptad=./data/$modelbasename
