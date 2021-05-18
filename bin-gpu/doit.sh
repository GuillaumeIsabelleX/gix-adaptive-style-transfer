#!/bin/bash
if [ "$1" == "" ] || [ "$2" == "" ]; then 
	echo "Usage: $0 <conf render bash source> <checkpoint1 checkpoint2 ...>"
	exit
fi
#Run the batch which will load the env and start the rendering
arr=("$@")


if [ -f "${arr[0]}" ] #Tranform the script to run for the container context
        then arr[0]="/work/$1"
fi

./exec.sh batch.sh "${arr[@]}"


