if [ "$droxuplib" == "" ]; then source _env.sh ; fi

droxupload() {
  local rb=$1;  local rr=$2
  local restag=$rr'x';export respath=$rb/$restag
  echo "------DROX---$restag------"
  #echo "---Restag: $restag ---------"
  #echo "---Respath: $respath ---------"
  (cd $respath;pwd;bash $droxuplib &> /dev/null && echo "----done uploading $restag--- ") &
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