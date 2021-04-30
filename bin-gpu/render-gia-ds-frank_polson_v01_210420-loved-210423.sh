#!/bin/bash

export savedirnamespace=frank_polson_v01_210420__210423_loved_pass2
export dimloop="256 512 768 1024 1280 1536 1792 2048 2304 2560 2816"
export dimloop="768 1536"
export chks_long_all="15 30 45 60 75 90 105 120 135 150 165 180 195 210 225 240 255 270 285 300"
export partial_210108="30 45 60 75 90 105 120 135 150 165 180 195 210 225 240 255 270 285 300"


#iteration 2012270346 - IMG_0019 choosen
#export chks="30 105 150 225 240 270 285 300"
export chks=$chks_long_all
#export chks=$partial_210108


#contentpath=/a/lib/samples/ap__210217

contentpath=/a/lib/samples/content0014-0019min
contentpath=/a/lib/samples/content_210314
contentpath=/a/lib/samples/pierre
#contentpath=/a/lib/samples/sketch_redraw_2103

contentpath=/a/lib/samples/content
contentpath=/a/lib/results/frank_polson_v01_210420__210421/_loved


modeltag=model_gia-ds-frank_polson_v01_210420_new
ftag=fp_s01-v01

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


