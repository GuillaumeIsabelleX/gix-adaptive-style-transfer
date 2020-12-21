#!/bin/bash
echo "----------------------- ----------------------"

source _env.sh

source _setmodel2.sh picassojgwill201208
#source _setmodel2.sh criss

#model_picassojgwill_201208

echo "Mount Point::"
echo "$model_local_fullpath:/$model_rel_path"
echo "------------------------------------------"

# COMMENT OUT  during FEAT BRANCH
#export container_tag=jgwill/gix-adaptive-style-transfer-feat__2012181051__switch:cpu

#mkdir -p $model_local_fullpath

echo "---------------------------------------------------"
cmd="$docker_exec run -it --memory=3190493888 --memory-swap=-1 -v $(pwd):$container_workdir \
	-v $lib_root:$docker_lib_root \
	-v  $model_root/models:$container_models_fullpath \
	-e DISPLAY=$DISPLAY \
	$container_tag
	"
echo "-----------------The following command will ran :"
echo $cmd
sleep 1

$cmd
# $docker_exec run -it  -v $(pwd):$container_workdir \
# 	-v $lib_root:$lib_root \
# 	-v  $model_root:/$container_models_fullpath \
# 	-e DISPLAY=$DISPLAY \
# 	$container_tag
