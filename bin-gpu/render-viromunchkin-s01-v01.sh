#!/bin/bash

export savedirnamespace=viromunchkin-s01-v01_new
export dimloop="256 512 768 1024 1280 1536 1792 2048 2304 2560 2816"
export dimloop="256 512 768 1024 1280 1536 1792"
export chks_long_all="15 30 45 60 75 90 105 120 135 150 165 180 195 210 225 240 255 270 285 300"
export partial_210108="15 30 45 60 75 90"
export partial_210108="15"

#iteration 2012270346 - IMG_0019 choosen
#export chks="30 105 150 225 240 270 285 300"
export chks=$chks_long_all
#export chks=$partial_210108


#contentpath=/a/lib/samples/ap__210217

contentpath=/a/lib/samples/content0014-0019min
contentpath=/a/lib/samples/content_210314
contentpath=/a/lib/samples/content
#contentpath=/a/lib/samples/sketch_redraw_2103

#contentpath=/a/lib/samples/content

modeltag=model_gia-ds-viromunchkin-s01-v01_new
ftag=vm_s01-v01

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


