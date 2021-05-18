
#Loading functions
if [ -e $binroot/__fn.sh ]; then
       source $binroot/__fn.sh $@
fi
getenvo="--get-env-only"

#echo "Current FORIDIR is : $(pwd)"

FORIDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
#echo "FORIDIR: $FORIDIR"

DEBUG=1

d "--------------------------"
d "---------$0---------->>"
d source $FORIDIR/_fori_env.sh $1 $2 $3 $4 $5 $6
d "--------------------------"

source $FORIDIR/_fori_env.sh $1 $2 $3 $4 $5 $6
d "--------------------------"

if  [ "$3" == "$getenvo" ] ||  [ "$4" == "$getenvo" ] ||  [ "$5" == "$getenvo" ] || [ "$6" == "$getenvo" ] 
	then 
		echo "..."
	else
	
	# /work/i4.sh model_gia-young-picasso-v03-201216_new 240 2048 /a/lib/samples/content2012181444 /a/lib/results/it-chkp 240
	# ---------------------------------

	for i in $chks ;
		do 
			subdir=$img_res'x'
			cmd="$script $model $subdir $suffix $img_res $content $savedir $i"

			echo "-----fori.sh------>>----"
			echo "$cmd"
			echo "-----fori.sh------<<----"
			
			#echo "running...resolution :$img_res  "
			#sleep 1
			$cmd
			#echo "Done this iteration... listing"
			#sleep 1
			#ls $savedir/$subdir/*__$i* >> $savedir/index.md

	done

# Run the prep of the data view
#source $FORIDIR/ifor.sh
fi

