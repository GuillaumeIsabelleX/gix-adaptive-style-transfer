#!/bin/bash
#@STCGoal this is aim to generate a render script for one content that will launch the whole render 2 album (it is a workaround)

if [ -e $binroot/__fn.sh ] && [ "$FNLOADED" == "" ]; then
   source $binroot/__fn.sh $@
else
        echo "Could not load functions..."
        exit 1
fi
echo -n "Generating file..."

usage() {

	#echo "usage : $0 <SFILE> <TFILE> <CONTENTPATH> <RESO> [FSUFFIX]"
	echo "usage : $0 <SFILE> <CONTENTPATH> <RESO> [FSUFFIX] --run"
	echo --run  will run the render after then

}

SFILE="$1"

if [ "$SFILE" == "" ]; then 
	echo "Must specify the source model"
	usage 
	exit 1 
fi

#TFILE=$2
#if [ -e "$TFILE" ] ; then 
#	echo "File exist, exiting"
#	usage
#	exit 1
#fi

CONTENTPATH="$2"
if [ ! -e "$CONTENTPATH" ] ; then 
	echo "CONTENTPATH must be existing"
	usage
	exit 2
fi

RESO="$3"
if [ "$RESO" == "" ] ; then echo "Must specify resolution" 
	usage 
	exit 3 
fi

MASTERBATCHTEMPLATE="__Render2Album.sh-MODEL"
dttag='-'$(date +'%y%m%d%H%M')
FSUFFIX="$4"
if [ "$4" == "--run" ] ; then FSUFFIX=""; fi

#echo "contentpath=$CONTENTPATH"
ns=$(mkdirns "$CONTENTPATH" 1)
TFILE=$(echo "$SFILE" | sed  's/-MODEL/-'"$ns"'\.sh/g') #_render_env_dbg_v01b.sh-batch-MODEL
#MFILE=$(echo "$MASTERBATCHTEMPLATE" | sed -e 's/.sh-MODEL/-'"$ns"'.sh/g')  #__Render2Album.sh-MODEL
MFILE="_Render2Album-$TFILE"
#echo "NS:$ns..." ; echo  "TFILE:$TFILE" ; echo  "MFILE:$MFILE"
#exit
#echo -n "."
cp $MASTERBATCHTEMPLATE $MFILE && \
	sedescaping $TFILE RENDERBATCH $MFILE && echo "MFILE Created ($MFILE)" && \
	cp $SFILE $TFILE && echo "$TFILE Created" &&  \
	sedescaping $CONTENTPATH CONTENTPATH $TFILE && \
	echo "sedescaping RESO" && sedescaping $RESO RESO $TFILE && \
	if [ "$FSUFFIX" != "" ] ;then sedescaping $FSUFFIX FSUFFIX $TFILE ;else sedescaping $dttag FSUFFIX $TFILE	;fi && \
	echo -n "..." && echo "Done generating"$'\n'"$TFILE"$'\n'"run : ./$MFILE" || echo "FAILED generating TFILE"

if [ "$4" == "--run" ] || [ "$5" == "--run" ]; then
	echo "Running switch was used...";sleep 1
	echo "...So we run $MFILE...";sleep 2
	./$MFILE
fi

