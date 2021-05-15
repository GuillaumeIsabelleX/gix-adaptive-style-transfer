#!/bin/bash
echo "Batch starting"
sdir=/work
sfile=render-gia-ds-DavidBouchardGagnon-v01b-210510-864.sh
s=$sdir/$sfile
if [ "$1" == "" ] ; then #
  echo " Must specify checkpoints to render"
  echo "$0 <\"30 45\">"
  # <contentpath> <resolution>"
  exit 1
fi

export resultbase="/a/lib/results/gia-ds-DavidBouchardGagnon-v01b-210510-864/dbg_v01b"
chp=$(echo $1 | sed 's/"//')

export r=512
$s "$chp" $c $r
#Droxul
# echo $resultbase/$r'x' 
#  (cd $resultbase/$r'x';/a/bin/droxuplib.sh)&
#  echo "results will be sent in background"
#  sleep 1
# exit
r=1536
$s "$chp" $c $r
#Droxul 
 (cd $resultbase/$r'x';/a/bin/droxuplib.sh)&
 echo "results will be sent in background"
 sleep 1
r=2200
$s $chp $c $r
#Droxul 
 (cd $resultbase/$r'x';/a/bin/droxuplib.sh)&
 echo "results will be sent in background"
 sleep 1

c=/a/lib/samples/pierre
r=1536

$s $chp $c $r
#Droxul 
 (cd $resultbase/$r'x';/a/bin/droxuplib.sh)&
 echo "results will be sent in background"
 sleep 1