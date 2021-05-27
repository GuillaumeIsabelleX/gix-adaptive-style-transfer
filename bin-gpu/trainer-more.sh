#!/bin/bash
#@STCGoal train more than 300ik

source _env.sh 
source _setmodel.sh $1

last_checkpoint_to_train=405000
#export model_rel_path=model/models/$model_context_name
#export model_local_fullpath=$model_local_dir/$model_rel_path

#echo "model_local_fullpath: $model_local_fullpath"

if [ -e "/work/model.py" ]; then #we are in container context
	cp /work/model.py /model  && \
		echo "--We upgraded the model.py file --"
	sleep 1
	
	#made it our new version to train with
	
fi

export lib_root_folder=datasets
export lib_fullpath=$lib_root/$lib_root_folder/$lib_namespace
export model_name='model_'$modelbasename'_new'

#echo " model_name= $model_name"

#echo "data/$modelbasename"
#echo "$model_local_fullpath"


#echo "mkdir -p data/$modelbasename"

#sleep 1
mkdir -p data/$modelbasename
#sleep 1
cp -f $lib_fullpath/*jpg data/$modelbasename &> /dev/null
cp -f $lib_fullpath/*JPG data/$modelbasename &> /dev/null
cp -f $lib_fullpath/*PNG data/$modelbasename &> /dev/null
cp -f $lib_fullpath/*png data/$modelbasename &> /dev/null

sleep 1

CUDA_VISIBLE_DEVICES=0 python main.py \
                 --model_name=$model_name \
                 --batch_size=1 \
		 --total_steps=$last_checkpoint_to_train \
                 --phase=train \
                 --image_size=768 \
                 --lr=0.0002 \
                 --dsr=0.8 \
                 --ptcd=$lib_root/data_large \
                 --ptad=./data/$modelbasename
