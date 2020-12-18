
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "DIR: $DIR"

#source _fori_env.sh

# iterate all check point
#@STCGoal In one shot have an observation grid of all iteration
#@STCGoal Find the optimal checkpoint 
#export chks="60 75 90 105 120 135 150 165 180 195 210 225 240 255 270 285 300"
#export img_res=640
#export suffix="__"
#export suffixseparator="__"
#export model=model_gia-young-picasso-v03-201216_new
#export content=/a/lib/samples/content2012181444
#export savedir=/a/lib/results/it-chkp
#export script=/work/i4.sh
#export subdir=alls
#export savefullpath=$savedir/$subdir
#export ind=index2.md

source $DIR/_fori_env.sh

# /work/i4.sh model_gia-young-picasso-v03-201216_new 240 2048 /a/lib/samples/content2012181444 /a/lib/results/it-chkp 240
# ---------------------------------
echo "FIXING PERMISSION NOW..."
sudo chmod -R 775 $savefullpath
sudo chown -R jgi.jgi $savefullpath
cd $savefullpath
echo '# Training Timeline' > $ind
echo " " >> $ind


# Prep out data view header and stuff
export h='| Content '
export s='| ---'

for i in $chks ; do export h=$h' |'$i'k' ; done
for i in $chks ; do export s=$s'| ---' ; done

export h="$h |"
export s="$s |"
# Write the headers of out data view
echo "$h" >> $ind
echo "$s" >> $ind


# Passing thru each file to do the main work
cd $content

for f in * ; do
	# getting variable of base and file name no extension to work on stuff
	fname=$(basename $f)
        fbnameTMP=${fname%.*}
        echo $f $fbnameTMP
	
	export fixedname="$fbnameTMP.jpg"
	export fixednameori="$fbnameTMP.ori.jpg"


	# make a copy of the original

	FILE=$savefullpath/$fixednameori
	if [ -f "$FILE" ]; then
    		echo "$FILE exists."
	else 
    		echo "$FILE does not exist. COPYING..."
		cp -f $f $savefullpath/$fixednameori && echo "Copy of $f done"
	fi


	# Convert the original to the resolution of the inferences
	
	FILE=$savefullpath/$fixedname
	if [ -f "$FILE" ]; then
                echo "$FILE exists."
        else
                echo "$FILE does not exist. CONVERTING..." 
		convert $f  -resize $img_res $savefullpath/$fixedname  && echo "Conversion of $f done"
	fi

#content moved up


	#display ori and link to the file
	ori='[![]('$fixedname')]('$fixednameori')'	
	export l='| '$ori

	# Iterating to all checkpoints to generate our data view
	for i in $chks ;
        	do
        
		cfn=$fbnameTMP$suffix$suffixseparator$i'k.jpg'
		cimg='[!['$i'k]('$cfn')]('$cfn')'
		e='| '$cimg

		export l=$l$e
	done
	export l="$l |"
        
	echo "$h"
	echo "$s"
	echo "$l"
	cd $savefullpath

	######################## WRITTING
	#Header
#	echo " "  >> $ind
#	echo "----"  >> $ind
#	echo " "  >> $ind

#	echo '## '$fbnameTMP >> $ind

#	echo " "  >> $ind
	#echo '![]('$fixedname')' >> $ind
#	echo " "  >> $ind
	
	#Table
#	echo "$h" >> $ind
 #       echo "$s" >> $ind
        echo "$l" >> $ind
	#Add a rows of iteration in between each 
	echo "$h" >> $ind

	cd $content
done

# Committing results to remote repo
cd $savefullpath && pwd && sleep 2 &&(git pull;git add * ;pwd; git commit . -m "update:$ind $savefullpath" && git push) 

