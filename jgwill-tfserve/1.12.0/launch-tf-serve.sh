#!/bin/bash

source _env.sh
#Launch a Tensorflow model server


logfile=server.log


#launch
nohup tensorflow_model_server \
  --rest_api_port=$serverport \
  --model_name=$model_name \
  --model_base_path="${MODEL_DIR}" >$logfile 2>&1 &
sleep 1

echo run: tail $logfile
tail $logfile

