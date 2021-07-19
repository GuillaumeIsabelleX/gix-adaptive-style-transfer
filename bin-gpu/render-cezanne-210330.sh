#!/bin/bash

export savedirnamespace=cezanne_vo__210330

export chks_long_all="15 30 45 60 75 90 105 120 135 150 165 180 195 210 225 240 255 270 285 300"
export chks_long_all="15 30 45 60 75 90 105 120 135 150 165 180"
export partial_210108="15 30 45 60 75 90"
export partial_210108="15 30 45 60 75 90 105 120 135 150 1165 180 195"
export partial_210108="195 210 225 240 255 270 285 300"
export partial_210108="195 210 225 240 255"

#iteration 2012270346 - IMG_0019 choosen
#export chks="30 105 150 225 240 270 285 300"
export chks=$chks_long_all
export chks=$partial_210108


#contentpath=/a/lib/samples/ap__210217

contentpath=/a/lib/samples/content0014-0019min
contentpath=/a/lib/samples/content_210314
contentpath=/a/lib/samples/content

#contentpath=/a/lib/samples/content

dim=512
dtag=0_5k


ftag=cz__vo
modeltag=model_gia-ds-cezanne-vo_new

/work/fori.sh $dim $dtag $ftag $modeltag $contentpath

########################################################


