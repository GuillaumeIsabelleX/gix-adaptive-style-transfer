#!/bin/bash

export contentpath="/a/lib/samples/redraw/Sketch__2101240002__01_cc01-redraw.jpg"

export reso=1800
export fname='dbg_v01b_osiris'
export fsuffix=''
export chks="315"


export modelname="model_gia-ds-DavidBouchardGagnon-v01b-210510-864_new-315ik"

#OVERRIDE savedirnamespace
#export SAVEDIRNAMESPACE=myns


export ds="ds-DavidBouchardGagnon-v01b-210510-864"
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

