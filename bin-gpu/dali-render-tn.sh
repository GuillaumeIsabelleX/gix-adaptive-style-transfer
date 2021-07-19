#!/bin/bash

#source _env.sh

#where are the content sample
spath=/a/lib/samples

#Wraps which model will be rendered
rs=/work/render-dali-v01-210124.sh



c="contentdalyv01"
r=200
t="tn200b__dalyv01"
source $rs $spath/$c $r $t


c="contentpica"

t="tn200b__pica"
source $rs $spath/$c $r $t


#------------------

c="content0014"

t="tn200b"
source $rs $spath/$c $r $t


c="content"

t="tn200b"
source $rs $spath/$c $r $t






