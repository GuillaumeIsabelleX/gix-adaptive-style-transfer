#!/bin/bash

CHKS="315"
RESO=864
CONTENTPATH="/a/lib/samples/redraw/Sketch__2101240002__01_cc01-redraw.jpg"
FNAME='dbg_v01b_osiris'
DSNAME="ds-DavidBouchardGagnon-v01b-210510-864"
MODELNAME="model_gia-ds-DavidBouchardGagnon-v01b-210510-864_new-315ik"


masterPrefix="_Render2Album"
cnfPrefix='_'$masterPrefix'_conf'
RENDERNAME='__'$FNAME'.sh'
MFILE=$masterPrefix$RENDERNAME
RENDERBATCH=$cnfPrefix$RENDERNAME
RENDERCONFTEMPLATE=__Render2Album_conf-TEMPLATE.sh.gih
gih 	--t $RENDERCONFTEMPLATE \
	--CONTENTPATH $CONTENTPATH \
	--FNAME $FNAME \
	--RESO $RESO \
	--MODELNAME $MODELNAME --DSNAME $DSNAME \
	--CHKS "$CHKS" \
	--o $RENDERBATCH

MASTERTEMPLATE=__Render2Album.MAIN-TEMPLATE.sh.gih
gih 	--t $MASTERTEMPLATE \
	--RENDERBATCH $RENDERBATCH \
	--LOGFILENAME $MFILE \
	--o $MFILE

chmod +x $MFILE $RENDERBATCH

