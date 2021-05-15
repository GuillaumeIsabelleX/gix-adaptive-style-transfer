#!/bin/bash
#export savedirnamespace=gia-ds-DavidBouchardGagnon-v01a-210510__two_passes
export savedirnamespace=gia-ds-DavidBouchardGagnon-v01a-210510__pierreds
export dimloop="256 512 768 1024 1280 1536 1792 2048 2304 2560 2816"
export dimloop="512 1024"
export dimloop="1536"
#export dimloop="2048"
#export dimloop="2500"

export chks_long_all="15 30 45 60 75 90 105 120 135 150 165 180 195 210 225 240 255 270 285 300"
#export partial_210108="$1"
export partial_210108="30 45 60 75 90 105 120 135 150 165 180 195"
export partial_210108="210"


#iteration 2012270346 - IMG_0019 choosen
#export chks="30 105 150 225 240 270 285 300"
export chks=$chks_long_all
export chks=$partial_210108


#contentpath=/a/lib/samples/ap__210217

#contentpath=/a/lib/samples/content0014-0019min
#contentpath=/a/lib/samples/content_210314
#contentpath=/a/lib/samples/pierre

#contentpath=/a/lib/samples/sketch_redraw_2103
contentpath=/a/lib/datasets/pierret_ds_210512
#contentpath=$2

#contentpath=/a/lib/samples/content
#contentpath=/a/lib/samples/dbg/dbg_two_passes__tests__210515



modeltag=model_gia-ds-DavidBouchardGagnon-v01a-210510_new
ftag=dbg_v01

for d in $dimloop;
do 
	echo "---------------------------------"
	echo "- Processing dimention : $d ----"
	echo "--------------------------------"
	sleep 1
	dim=$d
	dtag=$d'x'
	/work/fori.sh $dim $dtag $ftag $modeltag $contentpath
done

########################################################


