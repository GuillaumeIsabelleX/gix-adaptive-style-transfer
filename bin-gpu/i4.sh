#!/bin/bash
#Loading functions
if [ -e $binroot/__fn.sh ]; then
       source $binroot/__fn.sh $@
fi
DEBUG=1
# Inference 
## This script is used by fori.sh, an multi-checkpoints inference renderer.
#-------------------------------------------------
#./i4.sh MODELNAME "/subdir" FILE_SUFFIX IMG_SIZE CONTENTDIR SAVEDIR CHKPOINT
#./i4.sh model_gia-young-picasso-v03-201216_new /subdir __suffix 1024 /a/lib/samples/content /a/lib/results/someoutput 285000
#source _env.sh
d "------------------i4.sh----------->>----"
if [ "$4" != "" ]; then 
	export image_size=$4
fi
dvar image_size

#echo "Image size: $image_size"
if [ "$7" != "" ]; then 
	export ckpt_k=$7
fi
export ckpt_nmbr=$ckpt_k'000'
#echo "ckpt_nmbr=$ckpt_nmbr"
dvar ckpt_nmbr

if [ "$3" != "" ]; then 
	export file_suffix=$3'__'$ckpt_k'k'
fi
dvar file_suffix

#echo "file_suffix=$file_suffix"

#export content=/a/lib/samples/content/
if [ "$5" != "" ]; then 
	export content=$5
fi
dvar content

#export savedir=/a/lib/results/$1$2
if [ "$2" != "" ]; then 
	export savesubdir=$2
else
	export savesubdir=$image_size'x'
fi
dvar savesubdir

if [ "$6" != "" ]; then 
	export savedir=$6/$savesubdir
else 
	d "ARG 6 WAS NULL"
fi

dvar savedir
if [ "$1" != "" ]; then 
	export modelname=model_$1
fi

export modelname1=model_$1
replacerstr="model_"
secondString=""

export modelname1="${modelname1/model_model_/$secondString}"
export modelname1="${modelname1/$replacerstr/$secondString}"
export modelname1="${modelname1/model_model_/$secondString}"

export modelname=model_$modelname1
dvar modelname 

if [ "$1" == "$getenvo" ] || [ "$2" == "$getenvo" ] || [ "$3" == "$getenvo" ]||[ "$4" == "$getenvo" ] || [ "$image_size" == "123456" ] || [ "$image_size" == "1234" ] ; 	then 

	echo "..."
else 

echo "------i4-----ENV--$0---------------"
dvar ftag savedir savedirnamespace savedirbase savefullpath modeltag libresultroot image_size
echo "------i4-----ENV---$0----<<----------"


	rm -f data/* &> /dev/null
	cp -f $content/*jpg data &> /dev/null
	cp -f $content/*png data &> /dev/null
	cp -f $content/*JPG data &> /dev/null
	cp -f $content/*PNG data &> /dev/null

	#CUDA_VISIBLE_DEVICES=-1 python main.py \
	#echo "CUDA_VISIBLE_DEVICES=$CUDA_VISIBLE_DEVICES"
	#sleep 1
CUDA_VISIBLE_DEVICES=-1

	cmd="python main.py \
		--model_name=$modelname \
		--phase=inference \
		--image_size=$image_size \
		--ii_dir data \
		--save_dir=$savedir/ \
		--file_suffix=$file_suffix \
		--ckpt_nmbr=$ckpt_nmbr"
echo "$cmd"
$cmd

	if  [ $savedir != "/" ] ; then # so we dont fuck the whole OS with permissions...
		chown -R 1000.1000 $savefullpath &> /dev/null
	fi
fi

#chmod 777 $savedir/*
#./i4.sh model_gia-young-picasso-v03-201216_new /subdir __suffix 1024 /a/lib/samples/content /a/lib/results/someoutput 285000
