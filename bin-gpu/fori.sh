

# iterate all check point
#@STCGoal In one shot have an observation grid of all iteration
#@STCGoal Find the optimal checkpoint 
export chks="60 75 90 105 120 135 150 165 180 195 210 225 240 255 270"
export img_res=640
export suffix="__"
export model=model_gia-young-picasso-v03-201216_new
export content=/a/lib/samples/content2012181444
export savedir=/a/lib/results/it-chkp
export script=/work/i4.sh
export subdir=alls

# /work/i4.sh model_gia-young-picasso-v03-201216_new 240 2048 /a/lib/samples/content2012181444 /a/lib/results/it-chkp 240
# ---------------------------------

for i in $chks ;
	do 
	#	subdir=$i
		cmd="$script $model $subdir $suffix $img_res $content $savedir $i"

		echo "$cmd"
		echo "running..."
		sleep 1
		$cmd
		echo "Done this iteration... listing"
		sleep 1
		ls $savedir/$subdir/*__$i* >> $savedir/index.md

done

#for i in $chks ;
#        do
        #       subdir=$i
        #        cmd="$script $model $subdir $suffix $img_res $content $savedir $i"
	# #content
#	for f in $content/* ; do
#		echo $f

#	done
        

#done

