#!/bin/bash
echo "Batch $0 starting"
sleep 1
sdir=/work
sfile=render-gia-ds-DavidBouchardGagnon-v01b-210510-864.sh
s=$sdir/$sfile
chmod +x $s
cd /model

droxupload() {
  local rb=$1;  local rr=$2
  local restag=$rr'x';export respath=$rb/$restag
  echo "------DROX---$restag------"
  #echo "---Restag: $restag ---------"
  #echo "---Respath: $respath ---------"
  (cd $respath;pwd;bash /a/bin/droxuplib.sh &> /dev/null && echo "----done uploading $restag--- ") &
  #echo "$rr : Results will be sent in background"
  echo "-----------------------------";sleep 3
}
renderpass(){
  local ss=$1;local chpp=$2 ; local cc="$3";local rr="$4";local rb=$5
  echo "----Starting to process:-chpp:$chpp--$rr---->>>"
  sleep 1
  #echo $ss "$chpp" $cc $rr 
  $ss "$chpp" $cc $rr
  droxupload "$rb" "$rr"
  echo "---Ending processing--chpp:$chpp--$rr----<<<"
}

#can we learn that from the ENV ??
#export resultbase="/a/lib/results/gia-ds-DavidBouchardGagnon-v01b-210510-864/dbg_v01b"
source $s 1234 $2 $3 --get-env-only
export resultbase="$savedir"
echo "-----------ENV-----------------"
echo "savedir:$savedir"
echo "savedirnamespace:$savedirnamespace"
echo "savedirbase:$savedirbase"
echo "savefullpath:$savefullpath"
echo "modeltag:$modeltag"
echo "libresultroot:$libresultroot"
echo "ftag:$ftag"
echo "-----------ENV-----------------"


if [ "$1" == "" ] ; then #
  echo " Must specify checkpoints to render"
  echo "$0 <30 45 ...> \"<resolutions>\""
  # <contentpath> <resolution>"
  exit 1
fi
arr=("$@")
for chp in "${arr[@]}"; do
#for chp in ("$@"); do

  #chp=$(echo "$1" | sed 's/"//')
  #echo "----chp:$chp--------"
  
  #chp="$1"
  #ress=$(echo $2 | sed 's/"//')
 
  c=/a/lib/samples/sc
  export r=511

  #renderpass $s $chp "$c" 600 "$resultbase"

  # renderpass $s "$chp" "/a/lib/datasets/SmallCreation" 520 "$resultbase"

  # renderpass $s $chp "$c" 512 "$resultbase"

  # renderpass $s "$chp" "/a/lib/samples/content" 576 "$resultbase"


#   renderpass $s "$chp" "$c" 1536 "$resultbase"
#   renderpass $s "$chp" "$c" 2200 "$resultbase"

# #composite

  renderpass $s "$chp" "/a/lib/results/gia-ds-DavidBouchardGagnon-v01b-210510-864/dbg_v01b/600x" 2049 "$resultbase"

  # renderpass $s "$chp" "/a/lib/results/gia-ds-DavidBouchardGagnon-v01b-210510-864/dbg_v01b/520x" 2202 "$resultbase"

  # renderpass $s "$chp" "/a/lib/results/gia-ds-DavidBouchardGagnon-v01b-210510-864/dbg_v01b/512x" 2200 "$resultbase"

  #  renderpass $s "$chp" "/a/lib/results/gia-ds-DavidBouchardGagnon-v01b-210510-864/dbg_v01b/512x" 1300 "$resultbase"

  #  renderpass $s "$chp" "/a/lib/results/gia-ds-DavidBouchardGagnon-v01b-210510-864/dbg_v01b/512x" 2060 "$resultbase"

  #  renderpass $s "$chp" "/a/lib/results/gia-ds-DavidBouchardGagnon-v01b-210510-864/dbg_v01b/1300x" 2061 "$resultbase"


  #renderpass $s "$chp" "/a/lib/results/gia-ds-DavidBouchardGagnon-v01b-210510-864/dbg_v01b/576x" 2076 "$resultbase"
  
  #   renderpass $s "$chp" "/a/lib/datasets/gia-ds-DavidBouchardGagnon-v01a-v01b-diff" 720 "$resultbase"

  #  renderpass $s "$chp" "/a/lib/results/gia-ds-DavidBouchardGagnon-v01b-210510-864/dbg_v01b/720x" 2072 "$resultbase"

  #   renderpass $s "$chp" "/a/lib/datasets/gia-ds-DavidBouchardGagnon-v01a-v01b-diff" 2024 "$resultbase"

 

  #renderpass $s "$chp" "/a/lib/results/gia-ds-DavidBouchardGagnon-v01b-210510-864/dbg_v01b/576x" 2100 "$resultbase"

  #renderpass $s "$chp" "/a/lib/results/gia-ds-DavidBouchardGagnon-v01b-210510-864/dbg_v01b/640x" 2100 "$resultbase"

  #renderpass $s "$chp" "/a/lib/samples/pierre" 1536 "$resultbase"

  # renderpass $s "$chp" "/a/lib/datasets/pierret_ds_210512-864" 640 "$resultbase"
done

sleep 18
