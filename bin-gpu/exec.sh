#!/bin/bash
echo "----------------------- ----------------------"
#@STCGoal Fix the CPU in the GPU version of the host, save the container as new tag gpu-cpu 
#@STCIssue Limitation of infrastructure GPU

source _env.sh

# This is not used

source _setmodel2.sh DEPRECATING

#export container_tag=guillaumeai/ast:gpu-cpu-limitation-210421

#drox support
export container_tag=guillaumeai/ast:gpu-cpu-limitation-210516

#export container_tag=jgwill/gix-adaptive-style-transfer-feat__2012181051__switch:cpu
args="$@"
if [ -f "$1" ]; then #we spec a file
	#chg args
	args="/work/$1"
	shift 
	args+=" \"$@\""
fi


echo "---------------------------------------------------"
cmd="$docker_exec run -t --rm -v $(pwd):$container_workdir \
	-v $lib_root:$docker_lib_root \
	-v  $model_root/models:$container_models_fullpath \
	-e DISPLAY=$DISPLAY \
	$dkrun_mount_droxconf_config_args \
	$container_tag "$args"
	"
echo "-----------------The following command will ran :"
echo $cmd
sleep 1

$cmd

