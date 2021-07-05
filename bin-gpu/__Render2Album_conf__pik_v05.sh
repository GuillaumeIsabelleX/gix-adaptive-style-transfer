#!/bin/bash

export contentpath="/a/lib/samples/redraw/Sketch__2101240002__01_cc01-redraw.jpg"
export contentpath="/a/lib/results/gia-young-picasso-v05-2101082232/pik_v05-2200/2200x"

export reso=2202
export fname='pik_v05'
export fsuffix=''
export chks="315 345 360 375 390 405"


export modelname="model_gia-young-picasso-v05-2101082232_new"

#OVERRIDE savedirnamespace
#export SAVEDIRNAMESPACE=myns


export ds="gia-young-picasso-v05-2101082232"
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

