#!/bin/bash

export contentpath="/a/lib/samples/redraw/Sketch__2101240002__01_cc01-redraw.jpg"

export reso=864
export fname='dali_v02'
export fsuffix=''
export chks="120 180 240 270 315"


export modelname="model_gia-ds-daliwill-210123-v02_new"

#OVERRIDE savedirnamespace
#export SAVEDIRNAMESPACE=myns


export ds="gia-ds-daliwill-210123-v02"
#__Render2Album_conf_EXEC_LOCAL.sh
if [ -e "__Render2Album_conf_EXEC_LOCAL.sh" ] ; then 
	. __Render2Album_conf_EXEC_LOCAL.sh
	echo "Loaded from current"
	sleep 1
else 
	. /work/__Render2Album_conf_EXEC_LOCAL.sh
	echo "Loaded from /work"
	sleep 2
fi

