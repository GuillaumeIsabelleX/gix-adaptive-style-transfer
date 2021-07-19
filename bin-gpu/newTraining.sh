#!/bin/bash

#Loading functions
if [ -e $binroot/__fn.sh ]; then
                source $binroot/__fn.sh $@
fi


cdir=$(pwd)
sdir=$cdir

ds="$1"
ftag="$2"
expectedmodelname='model_'$ds'_new'

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
traintargetfile=train-$ds.sh
tfile=$sdir/$traintargetfile

if [ ! -e "$tfile" ]; then #@state do process, we are new
	cp $traintemplate $tfile && \
 	sed -i 's/DSNAME/'"$ds"'/g' $tfile && \
	  sed -i 's/FTAG/'"$ftag"'/g'  $tfile && msg_status "Train file completed $tfile" SUCCESS || \
	  (msg_status "Failed to prep $tfile" FAILED   && exit 1)

 fi
 cd $cdir


rendertargetfile=_render_env_$ds.sh
tfile=$sdir/$rendertargetfile
if [ ! -e "$tfile" ]; then #@state do process, we are new
	cp $rendertemplate $tfile && \
 	sed -i 's/DSNAME/'"$ds"'/g' $tfile && \
          sed -i 's/FTAG/'"$ftag"'/g'  $tfile && msg_status  "Render file completed $tfile" SUCCESS || \
	  (msg_status "Failed to prep $tfile" FAILED && exit 1)

fi

git add $traintargetfile $rendertargetfile &> /dev/null
git commit $traintargetfile $rendertargetfile -m "add:$ftag $ds" &> /dev/null && \
git push &> /dev/null &

#RWROOT Server launcher
#/a/src/rwml__adaptive_style_transfer/d2-run-TEMPLATE-all
svrtargetfile=$rwroot/d2-run-$ftag-all
svrtemplate=$rwroot/d2-run-TEMPLATE-all
cp $svrtemplate $svrtargetfile
sed -i 's/MODELNAME/'"$expectedmodelname"'/g' $svrtargetfile &&  msg_status  "SVR file created $svrtargetfile" SUCCESS ||  \
          msg_status "Failed to prep $tfile" FAILED
(cd $rwroot;git add $svrtargetfile; git commit $svrtargetfile -m add:svr-$svrtargetfile  &> /dev/null; git pull  &> /dev/null ; git push  &> /dev/null )



# 
echo "---------------------Training and Rendering script generated-----------------"
echo "train :  ./$traintargetfile"
echo "render:  ./doit.sh $rendertargetfile 15 30 45 ..."
echo "# $ftag : $ds"  >> .bash_aliases
echo "alias train$ftag=\"./$traintargetfile\"" >> .bash_aliases
echo "alias render$ftag=\"./doit.sh $rendertargetfile \""  >> .bash_aliases
echo 'alias render'$ftag'Edit="vi '$rendertargetfile' "'  >> .bash_aliases
echo "alias : source .bash_aliases then : renderinko-v01  or renderinko-v01Edit"
echo "alias svrd2$ftag=\"(cdrw;. $svrtargetfile)\""  >> .bash_aliases
echo "svr: (cdrw;. $svrtargetfile)   or  use alias : svrd2$ftag"

