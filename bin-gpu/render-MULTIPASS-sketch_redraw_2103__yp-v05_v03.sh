#!/bin/bash

export savedirnamespace=sketch_redraw_2103__210416
export dimloop="256 512 768 1024 1280 1536 1792 2048 2304 2560 2816"
export dimloop="256 512 768 1024"
export dimloop="1500 1700"
export dimloop="1900"
export dimloop="2048"
export dimloop="2304"
export chks_long_all="15 30 45 60 75 90 105 120 135 150 165 180 195 210 225 240 255 270 285 300"
#export chks_long_all="15 30 45 60 75 90 105 120 135 150 165 180"
export partial_210108="15 30 45 60 75 90"
export partial_210108="15 30 45 60 75 90 105 120 135 150 1165 180 195"
export partial_210108="195 210 225 240 255 270 285 300"
export partial_210108="120"

#iteration 2012270346 - IMG_0019 choosen

export chks=$chks_long_all
export chks=$partial_210108


#contentpath=/a/lib/samples/ap__210217

#contentpath=/a/lib/samples/content0014-0019min
#contentpath=/a/lib/samples/content_210314
#contentpath=/a/lib/samples/content
contentpath="/a/lib/samples/Sketch__2101240002__pass02_redraw__210416__v05"


modeltag=model_gia-young-picasso-v05-2101082232_new
modeltag=model_gia-young-picasso-v03-201216_new
ftag=yp__v03_

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


