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

## @STCGoal Well organized relational rendering and classification / presentation 
## @a A log of what is rendered where we will 
. $1
tdatadir=$libroot/results/$savedirnamespace/$ftag/.gia
mkdir -p $tdatadir
tdatafile=$tdatadir/renderinglog.giads
echo "#@@@@$(date)&&&&" >> $tdatafile
echo "$_TORENDER" >> $tdatafile
echo "&&&&" >> $tdatafile
echo "$modelname" >> $tdatafile
echo "&&&&" >> $tdatafile
echo "${arr[@]}" >> $tdatafile
echo "&&&&" >> $tdatafile

## @ref What do we have exported from that file ??
#export ds=DSNAME
#export modelname='model_'$ds'_new'
#export modeltag=$modelname
#export ftag=FTAG
#export savedirnamespace=${ds//"gia-ds-"/}


##

## @a where actually a lot happens ;)
./exec.sh batch.sh "${arr[@]}"

#@state we log when we are ending
echo "#$(date)" >> $tdatafile


