#!/bin/bash

#Loading functions
if [ -e $binroot/__fn.sh ]; then
                source $binroot/__fn.sh $@
fi


cdir=$(pwd)
sdir=$cdir

ds="$1"
ftag="$2"
if [ "$1" == "" ] || [ "$2" == "" ] ; then 
	echo "Usage :"
	echo "     $0  <dsname> <ftag>"
	exit 1
fi

traintemplate=$sdir/train-gia-ds-TEMPLATE.sh
rendertemplate=$sdir/_render_env_gia-ds-TEMPLATE.sh
export PATTERN="DSNAME"
export PATTERN="FTAG"

cd $cdir
tfile=$sdir/train-$ds.sh
traintargetfile=$tfile
if [ ! -e "$tfile" ]; then #@state do process, we are new
	cp $traintemplate $tfile && \
 	sed -i 's/DSNAME/'"$ds"'/g' $tfile && \
	  sed -i 's/FTAG/'"$ftag"'/g' && msg_status "Train file completed $tfile" 0 || \
	  (msg_status "Failed to prep $tfile" 1   && exit 1)

 fi
 cd $cdir
tfile=$sdir/_render_env_$ds.sh
rendertargetfile=$tfile
if [ ! -e "$tfile" ]; then #@state do process, we are new
	cp $rendertemplate $tfile && \
 	sed -i 's/DSNAME/'"$ds"'/g' $tfile && \
          sed -i 's/FTAG/'"$ftag"'/g' && msg_status "Render file completed $tfile" 0 || \
	  (msg_status "Failed to prep $tfile" 1 && exit 1)

fi

echo "train :  cd $cdir; ./$traintargetfile"
echo "render: cd $cdir; ./doit.sh $rendertargetfile 15 30 45 ..."
echo "# $ftag : $ds"  >> .bash_aliases
echo "alias train$ftag=\"./$traintargetfile\"" >> .bash_aliases
echo "alias render$ftag=\"./doit.sh $rendertargetfile \""  >> .bash_aliases

