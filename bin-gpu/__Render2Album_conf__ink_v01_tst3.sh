#!/bin/bash

#export contentpath="/a/lib/samples/redraw/Sketch__2101240002__01_cc01-redraw.jpg"
export contentpath="/a/lib/results/Inktobers-v01-210611-864x/ink_v01_tst3-2200"

export reso=2202
export fname='ink_v01_tst4'
export fsuffix=''
export chks="210 225 240 255 270 285 300 315 330 345 360 375 390 405"


export modelname="model_gia-ds-Inktobers-v01-210611-864x_new"

#OVERRIDE savedirnamespace
#export SAVEDIRNAMESPACE=myns


export ds="gia-ds-Inktobers-v01-210611-864x"
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

