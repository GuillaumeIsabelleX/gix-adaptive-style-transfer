#!/bin/bash
if [ -e $binroot/__fn.sh ] && [ "$FNLOADED" == "" ]; then
   source $binroot/__fn.sh $@
else
        echo "Could not load functions..."
        exit 1
fi
echo -n "Generating file..."

usage() {

	echo "usage : $0 <SFILE> <TFILE> <CONTENTPATH> <RESO> [FSUFFIX]"

}

SFILE=$1

if [ "$SFILE" == "" ]; then 
	echo "Must specify the source model"
	usage 
	exit 1 
fi

TFILE=$2
if [ -e "$TFILE" ] ; then 
	echo "File exist, exiting"
	usage
	exit 1
fi

CONTENTPATH=$3
if [ ! -e "$CONTENTPATH" ] ; then 
	echo "CONTENTPATH must be existing"
	usage
	exit 2
fi

RESO=$4
if [ "$RESO" == "" ] ; then echo "Must specify resolution" 
	usage 
	exit 3 
fi
	
FSUFFIX=$5
echo "contentpath=$CONTENTPATH"
echo -n "."
cp $SFILE $TFILE && echo -n "..cp DONE.." && echo "escaping..." && \
sedescaping "CONTENTPATH" "$CONTENTPATH" $TFILE && \
sedescaping RESO $RESO $TFILE && \ 
if [ "$FSUFFIX" != "" ] ;then sedescaping FSUFFIX $FSUFFIX $TFILE ;	fi && \
echo -n "..." && echo "Done generating $TFILE" || echo "FAILED generating TFILE"


