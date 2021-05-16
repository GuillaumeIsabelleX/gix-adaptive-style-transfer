#!/bin/bash
echo "Batch $0 starting"
sleep 1
sdir=/work
sfile=render-gia-ds-DavidBouchardGagnon-v01b-210510-864.sh
s=$sdir/$sfile
chmod +x $s
cd /model

if [ "$1" == "" ] ; then #
  echo " Must specify checkpoints to render"
  echo "$0 <\"30 45\"> \"<resolutions>\""
  # <contentpath> <resolution>"
  exit 1
fi
export resultbase="/a/lib/results/gia-ds-DavidBouchardGagnon-v01b-210510-864/dbg_v01b"
arr=("$@")
for chp in "${arr[@]}"; do
#for chp in ("$@"); do

  #chp=$(echo "$1" | sed 's/"//')
  echo "----chp:$chp--------"
  
  #chp="$1"
  #ress=$(echo $2 | sed 's/"//')
  droxupload() {
    local rb=$1;  local rr=$2
    echo "------DROX---------"
    local restag=$rr'x';export respath=$rb/$restag
    echo "---Restag: $restag ---------"
    echo "---Respath: $respath ---------"
    (cd $respath;pwd;bash /a/bin/droxuplib.sh) &
    echo "$rr : Results will be sent in background"
    echo "-----------------------------";sleep 3
  }
  renderpass(){
    local ss=$1;local chpp=$2 ; local cc="$3";local rr="$4";local rb=$5
    echo "-------------chpp:$chpp--------------------"
    sleep 1
    #echo $ss "$chpp" $cc $rr 
    $ss "$chpp" $cc $rr
    droxupload "$rb" "$rr"
  }
  c=/a/lib/samples/sketch_redraw_2103
  export r=512

  renderpass $s $chp "$c" "$r" "$resultbase"
  #echo $s "$chp" $c $r ;$s "$chp" $c $r
  #droxupload "$resultbase" "$r"

  renderpass $s "$chp" "$c" 1536 "$resultbase"
  renderpass $s "$chp" "$c" 2200 "$resultbase"


  renderpass $s "$chp" "/a/lib/samples/pierre" 1536 "$resultbase"

done