#!/bin/bash
echo "----------------------- ----------------------"

source _env.sh

source _setmodel2.sh picassojgwill201208


# OVERRIDING THE CONTAINER TAG
export container_tag=jgwill/gia-ast:test
export container_tag=jgwill/gix-adaptive-style-transfer:gia-ast


echo "---------------------------------------------------"
cmd="$docker_exec run -it  -v $(pwd):$container_workdir \
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
