#!/bin/bash

#source _env.sh

#where are the content sample
spath=/a/lib/samples

#Wraps which model will be rendered
rs=/work/render-dali-v01-210124.sh



c="contentdalyv01"
r=3000
t="3k__dalyv01"
source $rs $spath/$c $r $t


c="contentpica"

t="3k__pica"
source $rs $spath/$c $r $t


#------------------

c="content0014"

t="3k__0014"
source $rs $spath/$c $r $t


c="content"

t="3k__content"
source $rs $spath/$c $r $t






