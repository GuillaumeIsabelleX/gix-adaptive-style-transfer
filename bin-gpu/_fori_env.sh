
#

export chks_long_all="15 30 45 60 75 90 105 120 135 150 165 180 195 210 225 240 255 270 285 300"
export partial_210108="15 30 45 60 75"
#iteration 2012270346 - IMG_0019 choosen
#export chks="30 105 150 225 240 270 285 300"
export chks=$chks_long_all
#export chks=$partial_210108
#export chks="225 150 120 255 270 285"
#export chks="30 75 120 150 225 240 255 270 285 300"
############################################################

export img_res=$1
export suffix="_$3_$2_"
export suffixseparator="__"
#export model=model_gia-young-picasso-v03-201216_new
export model=$4
#export content=/a/lib/samples/content2012181444
export content=$5
#export content=/a/lib/datasets/paintergansets/paul-cezanne
export savedir=/a/lib/results/it-chkp/$3
#export savedir=/a/lib/results/it-chkp
export script=/work/i4.sh
export subdir=$2
export savefullpath=$savedir/$subdir
export ind=index.md

#2048 2k v03 model_gia-young-picasso-v03-201216_new
#2048 2k v03 model_gia-young-picasso-v03-201216_new /a/lib/samples/content0014

