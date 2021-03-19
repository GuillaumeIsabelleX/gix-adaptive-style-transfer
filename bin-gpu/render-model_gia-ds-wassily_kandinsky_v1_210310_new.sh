#!/bin/bash

# @STCGoal  Render the iterations that are saved of model v03 variation 2 (which consist of a smaller --lr value when training

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

