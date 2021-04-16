#!/bin/bash

export savedirnamespace="wassily_kandinsky_v1_210310"

export chks_long_all="15 30 45 60 75 90 105 120 135 150 165 180 195 210 225 240 255 270 285 300"
#export chks_long_all="15 30 45 60 75 90 105 120 135 150 165 180"
#export partial_210108="15 30 45 60 75 90"
export partial_210108="15 30 45 60 75 90 105 120 135 150 1165 180 195"
export partial_210108="195 210 225 240 255 270 285 300"
export partial_210108="195 210 225 240 255"

#iteration 2012270346 - IMG_0019 choosen
export chks=$chks_long_all
#export chks=$partial_210108


#contentpath=/a/lib/samples/ap__210217

contentpath=/a/lib/samples/content0014-0019min
contentpath=/a/lib/samples/content_210314

#contentpath=/a/lib/samples/content

dim=2300
dtag=2_3k


ftag=wk__v01var1
modeltag=model_gia-ds-wassily_kandinsky_v1_210310_new

/work/fori.sh $dim $dtag $ftag $modeltag $contentpath

########################################################


