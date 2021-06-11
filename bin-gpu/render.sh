#!/bin/bash
#Loading functions
if [ -e $binroot/__fn.sh ]; then
       source $binroot/__fn.sh $@
fi

#LIMITATION BYPASS
export container_arc=cpu
#export savedirnamespace=gia-ds-DavidBouchardGagnon-v01a-210510__two_passes
#export savedirnamespace=gia-ds-pierret_ds_210512-864-v01-210517-864
export dimloop="256 512 768 1024 1280 1536 1792 2048 2304 2560 2816"
export dimloop="512 1024"
export dimloop="$3"
#export dimloop="2048"
#export dimloop="2500"

export chks_long_all="15 30 45 60 75 90 105 120 135 150 165 180 195 210 225 240 255 270 285 300"
if [ "$1" != "" ]; then
	export partial_210108="$1"
fi
#export partial_210108="30 45 60 75 90 105 120 135 150 165 180 195"
#export partial_210108="210" #Interesting checkpoint
#export partial_210108="240"
#export partial_210108="15 30 45"

#iteration 2012270346 - IMG_0019 choosen
#export chks="30 105 150 225 240 270 285 300"
export chks=$chks_long_all
export chks=$partial_210108

#echo "--------------------------------"
#echo "-------chks=$chks---------------"


#contentpath=/a/lib/samples/ap__210217

#contentpath=/a/lib/samples/content0014-0019min
#contentpath=/a/lib/samples/content0014-0019min
#contentpath=/a/lib/samples/content_210314
#contentpath=/a/lib/samples/pierre
#contentpath=/a/lib/samples/sketch_redraw_2103
#contentpath=/a/lib/samples/sketch__spider__210211
if [ "$2" != "" ]; then
	contentpath=$2
fi
#contentpath=/a/lib/samples/content
#contentpath=/a/lib/samples/dbg/dbg_two_passes__tests__210515



#modeltag=model_gia-ds-pierret_ds_210512-864-v01-210517-864_new
#ftag=pt_v01

#Enable just getting the Env from this
getenvo="--get-env-only"

if [ "$1" == "$getenvo" ] || [ "$2" == "$getenvo" ] || [ "$3" == "$getenvo" ] || [ "$4" == "$getenvo" ]  || [ "$5" == "$getenvo" ] || [ "$6" == "$getenvo" ]|| [ "$7" == "$getenvo" ] ; 	then 
	#echo "ENVONLY"
	#echo "Trying to load fori"
	dim="1234"
	dtag=$dim'x'
	if [ -f "/work/_fori_env.sh" ]; then 
	
		#echo "Loading fori from /work";
		#	echo 'source /work/_fori_env.sh $dim $dtag $ftag $modeltag $contentpath'
		#echo source /work/_fori_env.sh $dim $dtag $ftag $modeltag $contentpath
		DEBUG=0
		d "source /work/fori.sh $dim $dtag $ftag $modeltag $contentpath"
		source /work/fori.sh $dim $dtag $ftag $modeltag $contentpath
	else 
		echo "NOT ENV ONLY"
		
		if [ -f "./_fori_env.sh" ]; then 
			#echo "Loading fori from current dir";
			source ./fori.sh $dim $dtag $ftag $modeltag $contentpath; 

		fi
	fi

else  

	for dim in $dimloop;
	do 
	DEBUG=0
	dvar dim dimloop
		echo "---------------------------------"
		echo "- Processing resolution : $dim ----"
                echo "---------------------------------" #echo "-----$dtag $ftag $modeltag $contentpath---------------------------"
		#sleep 1
		
		# dim=$d
		dtag=$dim'x'
		/work/fori.sh $dim $dtag $ftag $modeltag $contentpath 
		#&> /dev/null
		
	done

	########################################################

fi

