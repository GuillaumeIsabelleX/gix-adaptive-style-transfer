#!/bin/bash
echo "----------------------- ----------------------"
#@STCGoal Fix the CPU in the GPU version of the host, save the container as new tag gpu-cpu 
#@STCIssue Limitation of infrastructure GPU

source _env.sh

# This is not used

source _setmodel2.sh DEPRECATING

#export container_tag=guillaumeai/ast:gpu-cpu-limitation-210421

#drox support
# SEEMS BUGGED
export container_tag=guillaumeai/ast:gpu-cpu-limitation-210518
#Restored that one
export container_tag=guillaumeai/ast:gpu-cpu-limitation-210516

#export container_tag=jgwill/gix-adaptive-style-transfer-feat__2012181051__switch:cpu
args="$@"
if [ -f "$1" ]; then #we spec a file
	#chg args
	
	tfile=/work/$1
	args="$tfile"
	shift 
	#args+=" \"$@\""
	args+=" $@"
fi

# Optionally use a second argument -bg
docker_run_context="-it --rm"
if [ "$2" == "-bg" ]; then # We will run container in BG
	docker_run_context=" -d -t --rm "
	echo "---------DOCKER BACKGROUND MODE --- $docker_run_context---"
	sleep 2
	args="$tfile"
	shift
	args+=" $@"
	
fi

echo "--------------------------------------"
echo "-----docker args :   "
echo "----$args-----"
echo "------------"

cmd="$docker_exec run $docker_run_context -v $(pwd):$container_workdir \
	--name "ast_render" \
	-v $lib_root:$docker_lib_root \
	-v  $model_root/models:$container_models_fullpath \
	-e DISPLAY=$DISPLAY \
	$dkrun_mount_droxconf_config_args \
	$dkrun_mount_binroot \
	$container_tag "$args"
	"
echo "-------RUNNING :"
echo $cmd
#sleep 1
echo "-------------------------------------"

$cmd
