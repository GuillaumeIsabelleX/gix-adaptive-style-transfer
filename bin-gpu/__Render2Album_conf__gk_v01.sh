#!/bin/bash

export contentpath="/a/lib/samples/redraw/Sketch__2101240002__01_cc01-redraw.jpg"
export contentpath="/a/lib/samples/contentslimmer/IMG_0025.jpg"
export contentpath="/a/lib/results/ds-GabrielleKelly-v01-210624-864x/gk_v01-2200/2200x/"

export reso=2250
export fname='gk_v01_redraw_twop'
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

