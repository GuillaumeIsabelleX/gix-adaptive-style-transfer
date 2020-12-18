source _env.sh
echo "--------------------Bellow the last checkpoint file-----------------"
x=$(ls -lt $modelsourcecontext/checkpoint_long/ | grep data | awk '// { print $9 }' ) ; echo $x | awk '// { print $1 }'
echo "---------------------------------------------------------------------------------------"


