#!/bin/bash
echo "----------------------- ----------------------"

source _env.sh

source _setmodel2.sh giacrypaint201205

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
