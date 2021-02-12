#!/bin/bash
echo "----------------------- ----------------------"

source _env.sh

export container_tag=jgwill/ast:cpu


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
