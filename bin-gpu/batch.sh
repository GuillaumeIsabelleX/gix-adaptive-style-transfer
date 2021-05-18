#!/bin/bash
echo "Batch $0 starting"
if [ -f "/work/_env.sh" ] ; then
  source /work/_env.sh
else 
  source _env.sh 
fi
#Loading functions
# if [ -e $binroot/__fn.sh ]; then
#                 source $binroot/__fn.sh $@
# fi

source $1

echo $modeltag $ftag


sdir=/work
sfile=render.sh
s=$sdir/$sfile
chmod +x $s
cd /model

# Source the rendering functions
if [ -f "/work/_fn_render.sh" ] ; then
  source /work/_fn_render.sh
else 
  source _fn_render.sh
fi


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
shift
arr=("$@")
for chp in "${arr[@]}"; do


  #echo "$TORENDER"
  #echo "--"
  # readarray -t y <<<"$TORENDER"
  y=(${TORENDER//$';'/ })
  for l in "${y[@]}"; do 
    l=$(echo "$l" |tr "#" " " | sed -e 's/;//g'  | sed -e 's/\ //g')
    if [ "$l" != "" ]; then

      ll=(${l//$','/ })
      c=${ll[0]}
      r=${ll[1]}
      isnotnumberexit $r "Resolution must be a number"
      #echo "c:$c, r:$r"
      
      # echo "renderpass \$s \$chp \$c \$r \$resultbase"
      # echo "s: $s"
      # echo "chp: $chp"
      # echo "renderpass $s $chp $c $r $resultbase"
      
      renderpass $s $chp $c $r "$resultbase"
      #sleep 2
    fi
  done
  #  renderpass $s $chp "$c" 600 "$resultbase"
  


  #chp=$(echo "$1" | sed 's/"//')
  #echo "----chp:$chp--------"
  
  #chp="$1"
  #ress=$(echo $2 | sed 's/"//')
 
  # c=/a/lib/samples/sc
  # export r=511

  # renderpass $s $chp "$c" 600 "$resultbase"

  # renderpass $s "$chp" "/a/lib/datasets/SmallCreation" 520 "$resultbase"

  # renderpass $s $chp "$c" 512 "$resultbase"

  # renderpass $s "$chp" "/a/lib/samples/content" 576 "$resultbase"


#   renderpass $s "$chp" "$c" 1536 "$resultbase"
#   renderpass $s "$chp" "$c" 2200 "$resultbase"

# #composite

  # renderpass $s "$chp" "/a/lib/results/gia-ds-DavidBouchardGagnon-v01b-210510-864/dbg_v01b/600x" 2049 "$resultbase"

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
