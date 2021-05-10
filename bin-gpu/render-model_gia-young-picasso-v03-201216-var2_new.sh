#!/bin/bash

# @STCGoal  Render the iterations that are saved of model v03 variation 2 (which consist of a smaller --lr value when training

#contentpath=/a/lib/samples/ap__210217

contentpath=/a/lib/samples/content0014-0019min

dim=2200
dtag=2_2k


ftag=v03var2
modeltag=model_gia-young-picasso-v03-201216-var2_new

/work/fori.sh $dim $dtag $ftag $modeltag $contentpath

########################################################

# Render the prewious variation --lr 0.0002
ftag=v03var1
modeltag=model_gia-young-picasso-v03-201216_new

/work/fori.sh $dim $dtag $ftag $modeltag $contentpath

