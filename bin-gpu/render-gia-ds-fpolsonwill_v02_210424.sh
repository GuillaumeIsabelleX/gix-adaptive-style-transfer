#!/bin/bash

export savedirnamespace=gia-ds-fpolsonwill_v02_210424
export dimloop="256 512 768 1024 1280 1536 1792 2048 2304 2560 2816"
export dimloop="768 1444"

export chks_long_all="15 30 45 60 75 90 105 120 135 150 165 180 195 210 225 240 255 270 285 300"
export partial_210108="$1"


#iteration 2012270346 - IMG_0019 choosen
#export chks="30 105 150 225 240 270 285 300"
export chks=$chks_long_all
export chks=$partial_210108


#contentpath=/a/lib/samples/ap__210217

#contentpath=/a/lib/samples/content0014-0019min
#contentpath=/a/lib/samples/content_210314
#contentpath=/a/lib/samples/pierre
#contentpath=/a/lib/samples/sketch_redraw_2103

contentpath=/a/lib/samples/content


modeltagv1=model_gia-ds-frank_polson_v01_210420_new
modeltag=model_gia-ds-fpolsonwill_v02_210424_new
ftag=fp_s02-v02

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


