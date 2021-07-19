source _env.sh
du -a $modelsourcecontext | grep data | grep long | grep 0000 | awk '/select/ { print $2 }'


