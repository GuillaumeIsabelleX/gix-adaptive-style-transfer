source _env.sh
docker run -it --rm -p $serverport:$serverport -v $MODEL_DIR:/a/model/models -v /a/lib:/a/lib guillaumeai/tf:serve
