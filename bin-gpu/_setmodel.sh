#!/bin/bash


source _env.sh

export train_script=./trainer.sh

#@STCIssue Usage of the model full path generate issue model_model_MODELNAME
#FIX  
replacerstr="model_"
secondString=""
modelnametmp=$1
export modelnameonly="${modelnametmp/$replacerstr/$secondString}"

export model_context_name='model_'$modelnameonly'_new'

#@STCGoal Inference Context variables
export inference_script=./inferer.sh
export model_inference_name=model_$modelnameonly


export modelbasename=$modelnameonly
export lib_namespace=$modelnameonly

echo "Model context: $model_context_name"
echo "Modelbasename: $modelbasename"

#model_local_fullpath

export model_rel_path=model/models/$model_context_name
export model_local_fullpath=$model_local_dir/$model_rel_path

