#!/bin/bash

export contentpath="/a/lib/samples/redraw/Sketch__2101240002__01_cc01-redraw.jpg"
export contentpath="/a/lib/results/Inktobers-v01-210611-864x/ink_v01_tst-1224/1224x/Sketch__2101240002__01_cc01-redraw_ink_v01_tst-1224___270k.jpg"

#Redefining the content path in the sample so it would be found by the Montage
bn=$(basename $contentpath)
ff=${bn%.*}
mkdir -p /a/lib/samples/$ff
cp $contentpath /a/lib/samples/$ff
export contentpath="/a/lib/samples/$ff"


export reso=2400
export fname='ink_v01_twopass2k'
export fsuffix=''
export chks="CHKS"
export chks="165"


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

