#!/bin/bash

CHKS="120 180 240 270 315"
CHKS="CHKS"
RESO=1024
CONTENTPATH="/a/lib/samples/redraw/Sketch__2101240002__01_cc01-redraw.jpg"
FNAME='pik_v02b_tst'
DSNAME="gia-young-picasso-v02b-201210-864"
MODELNAME="model_gia-young-picasso-v02b-201210-864_new"


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

