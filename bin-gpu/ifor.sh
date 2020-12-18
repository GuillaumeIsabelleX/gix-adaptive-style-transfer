

# iterate all check point
#@STCGoal In one shot have an observation grid of all iteration
#@STCGoal Find the optimal checkpoint 
export chks="60 75 90 105 120 135 150 165 180 195 210 225 240 255 270 285 300"
export img_res=640
export suffix="__"
export suffixseparator="__"
export model=model_gia-young-picasso-v03-201216_new
export content=/a/lib/samples/content2012181444
export savedir=/a/lib/results/it-chkp
export script=/work/i4.sh
export subdir=alls
export savefullpath=$savedir/$subdir
export ind=index2.md

# /work/i4.sh model_gia-young-picasso-v03-201216_new 240 2048 /a/lib/samples/content2012181444 /a/lib/results/it-chkp 240
# ---------------------------------
echo "FIXING PERMISSION NOW..."
sudo chmod -R 775 $savefullpath
sudo chown -R jgi.jgi $savefullpath
cd $savefullpath
echo '# Training Timeline' > $ind
echo " " >> $ind

cd $content
for f in * ; do
	
	fname=$(basename $f)
        fbnameTMP=${fname%.*}
        echo $f $fbnameTMP
	export fixedname="$fbnameTMP.jpg"
	export fixednameori="$fbnameTMP.ori.jpg"

	FILE=$savefullpath/$fixednameori
	if [ -f "$FILE" ]; then
    		echo "$FILE exists."
	else 
    		echo "$FILE does not exist. COPYING..."
		cp -f $f $savefullpath/$fixednameori && echo "Copy of $f done"
	fi

	FILE=$savefullpath/$fixedname
	if [ -f "$FILE" ]; then
                echo "$FILE exists."
        else
                echo "$FILE does not exist. CONVERTING..." 
		convert $f  -resize $img_res $savefullpath/$fixedname  && echo "Conversion of $f done"
	fi

	export h='| '
	export s='| ---'

	for i in $chks ; do export h=$h' |' ; done
	for i in $chks ; do export s=$s'| ---' ; done
	
	export h="$h |"
	export s="$s |"

 	ori='![]('$fixedname')'	
	export l='| '$ori

	for i in $chks ;
        	do
        #       subdir=$i
        #        cmd="$script $model $subdir $suffix $img_res $content $savedir $i"
	# #content
		cfn=$fbnameTMP$suffix$suffixseparator$i'k.jpg'
		e='| ![]('$cfn')'
		export l=$l$e
	done
	export l="$l |"
        
	echo "$h"
	echo "$s"
	echo "$l"
	cd $savefullpath

	######################## WRITTING
	#Header
	echo " "  >> $ind
	echo " "  >> $ind

	echo '## '$fbnameTMP >> $ind

	echo " "  >> $ind
	#echo '![]('$fixedname')' >> $ind
	echo " "  >> $ind
	#Table
	echo "$h" >> $ind
        echo "$s" >> $ind
        echo "$l" >> $ind

	cd $content
done

cd $savefullpath && pwd && sleep 2 &&(git pull;git add * ;pwd; git commit . -m "update:$ind $savefullpath" && git push) 

