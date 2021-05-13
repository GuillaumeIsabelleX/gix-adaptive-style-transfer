#!/bin/bash


#source _env.sh

export train_script=./trainer.sh
export inference_script=./inference.sh

export model_context_name=model_$1

export modelbasename=$1
export lib_namespace=$1

echo "Model context: $model_context_name"
echo "Modelbasename: $modelbasename"

#model_local_fullpath

export model_rel_path=model/models/$model_context_name
export model_local_fullpath=$model_local_dir/$model_rel_path

