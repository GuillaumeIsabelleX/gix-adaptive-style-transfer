#!/bin/bash
#@STCIssue Set to Your ARC
export container_arc=cpu

#@STCGoal Set to your Local ENV where is stored your lib and models
export mount_root=/mnt/b

#@STCGoal Set the Target container name
export container_name=jgwill/gix-adaptive-style-transfer

#-------------------------------------
#@STCGoal Stay away of bellow unless your re-architecturing the whole thing
#---------------------------------------

export lib_root=$mount_root/lib
export docker_lib_root=/a/lib
export model_root=$mount_root/model


export container_models_fullpath=/model/models


# Where we do mount this dir to do some work on containers
export container_workdir=/work

# Running context

#@STCGoal adapt to env with --arc=cpu|gpu
#@STCIssue Manual update required for GPU Context
export docker_exec_gpu=nvidia-docker
export docker_exec_cpu=docker

if [ "$container_arc" = "cpu" ]; then
    export docker_exec=$docker_exec_cpu
    echo "Docker Exec is set to CPU ($docker_exec)"
else
    export docker_exec=$docker_exec_gpu
    echo "Docker Exec is set to GPU ($docker_exec)"
fi


export container_tag=$container_name:$container_arc
echo "Container tag is set: $container_tag"

export model_local_dir=$mount_root



