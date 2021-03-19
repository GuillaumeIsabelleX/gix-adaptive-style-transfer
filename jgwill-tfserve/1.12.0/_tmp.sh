source _env.sh
containertag="tensorflow/serving:1.12.0"
containertag="guillaumeai/tf:serve"

localmodelmountpath="/a/model/models"
hostlibpath="/a/lib"
locallibpath="/a/lib"
docker_run_cmd="docker"
docker_run_args="run -it --rm"

$docker_run_cmd $docker_run_args -p $serverport:$serverport -v $MODEL_DIR:/models/model -v $MODEL_DIR:$localmodelmountpath -v $hostlibpath:$locallibpath $containertag bash

