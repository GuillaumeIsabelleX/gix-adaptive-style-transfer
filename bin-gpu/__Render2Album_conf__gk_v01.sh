#!/bin/bash

export contentpath="/a/lib/samples/redraw/Sketch__2101240002__01_cc01-redraw.jpg"

export reso=2200
export fname='gk_v01'
export fsuffix=''
export chks="CHKS"


export modelname="model_ds-GabrielleKelly-v01-210624-864x_new"

#OVERRIDE savedirnamespace
#export SAVEDIRNAMESPACE=myns


export ds="ds-GabrielleKelly-v01-210624-864x"
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

