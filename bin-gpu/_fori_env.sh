
d "------_fori_env.sh----->>------"
#echo $1 $2 $3 $4 $5 
#sleep 1
#echo "--------------------------------------"
#  NOW DEFINE IT IN THE RENDER SCRIPT
#export savedirnamespace=ap__210217
#export savedirnamespace=xe__gia-young-picasso-v03-201216-var2
#export savedirnamespace=wassily_kandinsky_v1_210310


# Now DEFINE IT IN THE RENDER SCRIPT
#export chks_long_all="15 30 45 60 75 90 105 120 135 150 165 180 195 210 225 240 255 270 285 300"
#export partial_210108="15 30 45 60 75 90"
#export partial_210108="15 30 45 60 75 90 105 120 135 150 1165 180 195"
#export partial_210108="150 165 180 195 210 225 240 255 270 285 300"

#iteration 2012270346 - IMG_0019 choosen
#export chks="30 105 150 225 240 270 285 300"
#export chks=$chks_long_all
#export chks=$partial_210108
#export chks="225 150 120 255 270 285"
#export chks="30 75 120 150 225 240 255 270 285 300"$savefulldir
###########################################################
echo "1:$1, 2:$2, 3:$3, 4:$4, 5:$5, 6:$6"
echo " DOES THIS HAS THE RIGHT OUTPUT PATH : savefulldir=$savefulldir"
echo "------------------------CALISS ---_fori...-----------------------------"
sleep 3

if [ "$img_res" == "" ] ; then export img_res=$1 ; fi
export suffix="_$3_$img_res_"
export suffixseparator="__"
#export model=model_gia-young-picasso-v03-201216_new
export model=$4
#export content=/a/lib/samples/content2012181444
export content=$5
#export content=/a/lib/datasets/paintergansets/paul-cezanne
export contextfile=./contexts/__context.$HOSTNAME.sh
export libresultroot=/a/lib/results
export savedirbase=$libresultroot/$savedirnamespace
mkdir -p $savedirbase && echo "Created $savedirbase" || (echo "FAILED TO CREATE $savedirbase" && sleep 10 )

echo "export savedir=$savedirbase/$3" >> $FORIDIR/$contextfile
export savedir=$savedirbase/$3
echo "--savedir=$savedir" && sleep 1

export i4script=/work/i4.sh
export subdir=$2
export savefullpath=$savedir/$subdir
dvar subdir savefullpath

echo "export savefullpath=$savedir/$subdir" >> $FORIDIR/$contextfile
DEBUG=0
dcfile
dvar subdir

export ind=index.md

#2048 2k v03 model_gia-young-picasso-v03-201216_new
#2048 2k v03 model_gia-young-picasso-v03-201216_new /a/lib/samples/content0014

#echo "-------$0----"
