#!/bin/bash

source _env.sh 
source _setmodel.sh $1


#export model_rel_path=model/models/$model_context_name
#export model_local_fullpath=$model_local_dir/$model_rel_path

echo "model_local_fullpath: $model_local_fullpath"


export lib_root_folder=datasets
export lib_fullpath=$lib_root/$lib_root_folder/$lib_namespace
export model_name='model_'$modelbasename'_new'

echo " model_name= $model_name"

echo "data/$modelbasename"
echo "$model_local_fullpath"


echo "mkdir -p data/$modelbasename"

sleep 1
mkdir -p data/$modelbasename
sleep 1
cp -f $lib_fullpath/*jpg data/$modelbasename
cp -f $lib_fullpath/*JPG data/$modelbasename
cp -f $lib_fullpath/*PNG data/$modelbasename
cp -f $lib_fullpath/*png data/$modelbasename

sleep 1
# CPU Training (set to -1 means CPU)

#CUDA_VISIBLE_DEVICES=-1 
echo python main.py \
                 --model_name=$model_name \
                 --batch_size=1 \
                 --phase=train \
                 --image_size=768 \
                 --lr=0.0002 \
                 --dsr=0.8 \
                 --ptcd=$lib_root/data_large \
                 --ptad=./data/$modelbasename > train-tmp-cmd.sh
cp train-tmp-cmd.sh /work

