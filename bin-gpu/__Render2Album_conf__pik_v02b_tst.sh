#!/bin/bash

export contentpath="/a/lib/samples/redraw/Sketch__2101240002__01_cc01-redraw.jpg"

export reso=1024
export fname='pik_v02b_tst'
export fsuffix=''
export chks="CHKS"


export modelname="model_gia-young-picasso-v02b-201210-864_new"

#OVERRIDE savedirnamespace
#export SAVEDIRNAMESPACE=myns


export ds="gia-young-picasso-v02b-201210-864"
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

