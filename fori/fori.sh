
echo "Current dir is : $(pwd)"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "DIR: $DIR"


#source _fori_env.sh

# iterate all check point
#@STCGoal In one shot have an observation grid of all iteration
#@STCGoal Find the optimal checkpoint 
#export chks="60 75 90 105 120 135 150 165 180 195 210 225 240 255 270"
#export img_res=1024
#export suffix="__"
#export model=model_gia-young-picasso-v03-201216_new
#export content=/a/lib/samples/content2012181444
#export savedir=/a/lib/results/it-chkp
#export script=/work/i4.sh
#export subdir=alls
#export workdir=$(pwd)

source $DIR/_fori_env.sh $1 $2 $3 $4 $5

# /work/i4.sh model_gia-young-picasso-v03-201216_new 240 2048 /a/lib/samples/content2012181444 /a/lib/results/it-chkp 240
# ---------------------------------

for i in $chks ;
	do 
	#	subdir=$i
		cmd="$script $model $subdir $suffix $img_res $content $savedir $i"
		echo "--------------------------------------------------"
		echo "$cmd"
		echo "--------------------------------------------"
		echo "running...resolution :$img_res  "
		sleep 1
		$cmd
		echo "Done this iteration... listing"
		sleep 1
		ls $savedir/$subdir/*__$i* >> $savedir/index.md

done

# Run the prep of the data view
#source $DIR/ifor.sh

