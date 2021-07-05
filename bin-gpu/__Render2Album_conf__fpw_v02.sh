#!/bin/bash

export contentpath="/a/lib/samples/redraw/Sketch__2101240002__01_cc01-redraw.jpg"

export reso=2200
export fname='fpw_v02'
export fsuffix=''
export chks="315 330 345 360 375"


export modelname="model_gia-ds-fpolsonwill_v02_210424_new"

#OVERRIDE savedirnamespace
#export SAVEDIRNAMESPACE=myns


export ds="gia-ds-fpolsonwill_v02_210424"
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

