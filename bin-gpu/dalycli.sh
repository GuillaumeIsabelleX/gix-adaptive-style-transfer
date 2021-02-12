#!/bin/bash

#source _env.sh

#where are the content sample
spath=/a/lib/samples

#Wraps which model will be rendered
rs=/work/render-dali-v01-210124.sh



c="$1"
r=$2
t="$1__$2$3"
source $rs $spath/$c $r $t






