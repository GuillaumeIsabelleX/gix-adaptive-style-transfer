
#Loading functions
if [ -e $binroot/__fn.sh ]; then
      source $binroot/__fn.sh $@
      else source /a/bin/__fn.sh $@
fi

if [ "$droxuplib" == "" ]; then 
  if [ -f "/work/_env.sh" ] ; then
    source /work/_env.sh
  else 
    source _env.sh 
  fi
fi

droxupload() {
  local rb=$1;  local rr=$2
  local restag=$rr'x';export respath=$rb/$restag
  
  #echo "------DROX---$restag--->>---"
  #echo "---Restag: $restag ---------"
  #echo "---Respath: $respath ---------"
  if [ -e "$respath" ] ; then
  (cd $respath;bash $droxuplib &> /dev/null && echo "done uploading") &
  else
    echo "humm... $respath is non existent, you might want to check things up (ref:$0)"
    exit 3
  fi
  #echo "$rr : Results will be sent in background"
  #echo "-----------------------------";sleep 1
}

renderpass(){
  local ss=$1;local chpp=$2 ; local cc="$3";local rr="$4";local rb=$5
  #echo "----Starting to process:-chpp:$chpp--$rr---->>>"
  #echo " $ss $chpp $cc $rr "
  #sleep 1
  $ss "$chpp" $cc $rr && \
  droxupload "$rb" "$rr" && \
  echo ":)" || \
  (echo "Failed to render or upload" && exit 6)
}
